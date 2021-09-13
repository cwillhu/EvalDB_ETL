use evaldb;
set nocount on

--#################################################################################################
-- Create table fileList: file names, paths, etc for each data table in evaldb
--#################################################################################################

-- create fileList
drop table if exists fileList
create table fileList (
    fileID int not null identity(1,1) primary key,
    tableName nvarchar(255) default null, 
    filePath nvarchar(1000) default null, 
    batchNumber int default null, 
    processed int default 0,
    status nvarchar(1000), 
    error nvarchar(3000)
)
go

-- while loop variables
declare @curDirPath nvarchar(4000)
declare @curTableName nvarchar(255)
declare @returnValuesTable table (returnedFileName nvarchar(max), depth int, isFile bit) -- for system call
declare @numFiles int = -1
update tableInfo set processed = 0

-- populate fileList table
while (select count(*) from tableInfo where processed = 0) > 0
begin
    -- select table name and directory
    select top 1 @curTableName = tableName from tableInfo where processed = 0
    print 'Table: ' + @curTableName

    set @curDirPath = '\\host\DB-data$\\DB\EvaluationData\' + @curTableName

    -- get file list for this table via system call
    insert @returnValuesTable (returnedFileName, depth, isFile)
        exec master.sys.xp_dirtree @curDirPath, 1, 1 

    select @numFiles = count(*) from @returnValuesTable

    -- move list of files to table fileList
    insert into fileList (filePath)
        select @curDirPath + '\' + returnedFileName
        from @returnValuesTable
    delete from @returnValuesTable    

    -- set numFiles in tableInfo table
    update tableInfo set numFiles = @numFiles where tableName = @curTableName

    -- assign current table name to tableName col (for the set of files just returned by sys call)
    update fileList set tableName = @curTableName where tableName is NULL
    
    -- mark this table as processed
    update tableInfo set processed = 1 where tableName = @curTableName 
end
go
