use evaldb

--###########################################################################
--  Load data files with a given batchNumber into a table, using temp table
--###########################################################################

drop procedure if exists tableLoad_sp_WithTempTable
go

create procedure tableLoad_sp_WithTempTable
    @batchNumber int,
    @tableName varchar(255)
as

    set nocount on -- otherwise output buffer overflows when called from pyodbc

    -- Get table's column names, omitting fileID
    declare @colNames_NoFileID varchar(3000)
    select @colNames_NoFileID = colNames_NoFileID from tableInfo where tableName = @tableName

    -- Create name for global temp table for this table/batch
    declare @gtTableName varchar(255) = '##' + @tableName + '_Batch' + cast(@batchNumber as varchar(5))

    -- Prepare for loop over data files
    declare @curFile varchar(1000)
    declare @curFileID int
    update fileList set processed = 0 where tableName = @tableName and batchNumber = @batchNumber

    -- Iterate over files for this batch: load data into temp table, set fileID, then insert into primary table
    while (select count(*) from fileList where tableName = @tableName and batchNumber = @batchNumber and processed = 0) > 0
    begin
        -- Retrieve a filepath and fileID
        select top 1 @curFile = filePath, @curFileID = fileID from fileList where tableName = @tableName and batchNumber = @batchNumber and processed = 0

        -- Drop and create a global temp table using definition of primary table. Drop fileID column.
        execute(@tableName + '_sp_DropCreate ''' + @gtTableName + '''')
        execute('ALTER TABLE ' + @gtTableName + ' DROP COLUMN fileID')  -- I removed 'default null' constraint from all tables defs so this works easily

        -- Bulk load into temp table
        execute('BULK INSERT ' + @gtTableName + ' FROM ''' + @curFile + ''' WITH (KEEPNULLS, TABLOCK, ROWS_PER_BATCH=100000, FIRSTROW=1, FIELDTERMINATOR=''|'', ROWTERMINATOR=''0x0A'')')
        
        -- Transfer data into primary table. Use 'insert into..select' for minimal logging.
        execute('INSERT INTO ' + @tableName + ' SELECT *, ' + @curFileID + ' FROM ' + @gtTableName)

        -- Mark current file as processed
        update fileList set processed = 1 where filePath = @curFile
    end

	-- Drop temp table
	execute('DROP TABLE ' + @gtTableName)

go
