''' Load tables into SQL Server in parallel '''
from pyInovEval.mssql import Connection
from pyInovEval.logger import logger
from pyInovEval.util import valError
from threading import Thread
import time, os


def assignBatchNumbers(numBatches):
    ''' Assign batch numbers (range [1..numBatches]) to data files '''

    if not numBatches:
        valError('numBatches must be specified')
    
    logger.info(f'Assigning batch numbers in range: [1..{numBatches}]')        
    with Connection() as c:
        c.execute(f'fileList_sp_SetBatchNumber {numBatches}, null')


def dropCreateTable(tableName):
    ''' Drop and create a table '''

    logger.info(f'Drop-create {tableName}')        
    with Connection() as c:
        c.execute(f"{tableName}_sp_DropCreate '{tableName}'")


def checkpoint():
    ''' Issue checkpoint '''

    logger.info('Checkpoint')
    with Connection() as c:
        c.execute('checkpoint')


def loadBatch(method, tableName, batchNum):
    ''' Load files with a given batchNum into a table '''

    if method == 'bulk':  #no view, no temp table, no fileID, no rows_per_batch
        command = f"execute tableLoad_sp_BulkInsert_NoFileID {batchNum}, '{tableName}'"

    elif method == 'temp':  #temp table, fileID
        command = f"execute tableLoad_sp_WithTempTable {batchNum}, '{tableName}'"

    elif method == 'view':  #view, no fileID
        command = f"execute tableLoad_sp_WithView_NoFileID {batchNum}, '{tableName}'"

    with Connection() as c:
        c.execute(command)


def loadTable(method, tableName, numBatches):
    ''' Launch parallel loads of data files into a table '''

    logger.info(f"Begin parallel load of {tableName}")

    # Create threads
    batchNums = list(range(1,numBatches + 1))
    threads = [Thread(target=loadBatch, args=(method, tableName, batchNum)) for batchNum in batchNums]

    t0 = time.time() 

    # Begin execution
    for thread in threads:
        thread.start()

    # Wait for all threads to complete
    for thread in threads:
        thread.join()        

    logger.info(f"Elapsed time for parallel load of {tableName}: {(time.time() - t0):0.1f} seconds")


def createColumnStoreIndex(tableName):
    ''' Create clusterd columnstore index '''

    logger.info(f'Creating clustered columnstore index for {tableName}')
    indexName = tableName + '_ccindex'
    with Connection() as c:
        c.execute(f'create clustered columnstore index {indexName} on {tableName}')

    
def loadTables(method='bulk', tableNames=None, numBatches=56):
    ''' Load list of tables, each table in parallel '''

    if method not in ['temp', 'view', 'bulk']:
        valError('method must be temp, view or bulk')
            
    if not tableNames:
        tableNames = [f'tab{str(x).zfill(2)}' for x in range(1, 13)]

    logger.info(f"Loading tables with method '{method}': {', '.join(tableNames)}")

    assignBatchNumbers(numBatches)
    
    for tableName in tableNames:
        dropCreateTable(tableName)
        loadTable(method, tableName, numBatches)
        createColumnStoreIndex(tableName)
        checkpoint()
