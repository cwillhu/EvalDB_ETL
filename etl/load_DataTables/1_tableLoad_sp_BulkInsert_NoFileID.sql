use evaldb

--#######################################################################
--  Load data files with a given batchNumber into a table, with no FileID
--#######################################################################

drop procedure if exists tableLoad_sp_BulkInsert_NoFileID
go

create procedure tableLoad_sp_BulkInsert_NoFileID
    @batchNumber int,
    @tableName varchar(255)
as

    set nocount on -- otherwise output buffer overflows when called from pyodbc

    -- Prepare for loop over data files
    declare @curFile varchar(2000)
    update fileList set processed = 0 where tableName = @tableName and batchNumber = @batchNumber

    -- Iterate over files for this batch and load into table with bulk insert
    while (select count(*) from fileList where tableName = @tableName and batchNumber = @batchNumber and processed = 0) > 0
    begin
        -- Retrieve a filepath
        select top 1 @curFile = filePath from fileList where tableName = @tableName and batchNumber = @batchNumber and processed = 0

        -- Bulk load into table
        execute('BULK INSERT ' + @tableName + ' FROM ''' + @curFile + ''' WITH (KEEPNULLS, TABLOCK, FIRSTROW=1, FIELDTERMINATOR=''|'', ROWTERMINATOR=''0x0A'')')
        
        -- Mark current file as processed
        update fileList set processed = 1 where filePath = @curFile
    end

go
