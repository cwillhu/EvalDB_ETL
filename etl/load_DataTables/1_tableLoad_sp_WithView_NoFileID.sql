use evaldb;

--###################################################################################
--  Load data files with a given batchNumber into a table using views, without fileID
--###################################################################################

drop procedure if exists tableLoad_sp_WithView_NoFileID
go

create procedure tableLoad_sp_WithView_NoFileID
    @batchNumber int,
    @tableName varchar(255)
as
    set nocount on -- otherwise output buffer overflows when called from pyodbc

    -- Prepare for loop over this view's flat files
    declare @curFile varchar(1000)
    --declare @curFileID int
    declare @colNames_NoFileID varchar(3000)
    update fileList set processed = 0 where tableName = @tableName and batchNumber = @batchNumber
    
    -- Iterate over flat files for this view and load data
    declare @viewName varchar(255) = @tableName + '_View' + cast(@batchNumber as varchar(5))
    while (select count(*) from fileList where tableName = @tableName and batchNumber = @batchNumber and processed = 0) > 0
    begin
        -- Retrieve a filepath
        select top 1 @curFile = filePath from fileList where tableName = @tableName and batchNumber = @batchNumber and processed = 0

        -- Get this table's column names (omitting fileID column)
        select @colNames_NoFileID = colNames_NoFileID from tableInfo where tableName = @tableName

        -- Create view
        execute('DROP VIEW IF EXISTS ' + @viewName)
        execute('CREATE VIEW ' + @viewName + ' AS SELECT ' + @colNames_NoFileID + ' FROM ' + @tableName)

        -- Bulk load into view
        execute('BULK INSERT ' + @viewName + ' FROM ''' + @curFile + ''' WITH (KEEPNULLS, TABLOCK, ROWS_PER_BATCH=100000, FIRSTROW=1, FIELDTERMINATOR=''|'', ROWTERMINATOR=''0x0A'')')
        
        -- Mark current file as processed
        update fileList set processed = 1 where filePath = @curFile
    end
go