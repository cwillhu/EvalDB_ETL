use evaldb;

--##########################################################
-- Stored procedure to set batchNumber in fileList table 
--##########################################################

drop procedure if exists fileList_sp_SetBatchNumber
go

create procedure fileList_sp_SetBatchNumber
    @numBatches int,
    @tableName varchar(255)
as
   
    if @tableName is null
        begin
        update fileList set batchNumber = (fileID % @numBatches) + 1 -- add 1 so range is [1,numBatches]
        end
    else
        begin
        update fileList set batchNumber = (fileID % @numBatches) + 1  where tableName = @tableName
        end
go            

