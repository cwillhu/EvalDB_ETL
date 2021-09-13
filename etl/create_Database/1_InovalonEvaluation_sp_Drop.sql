
--####################################
-- Stored procedure to drop database
--####################################

-- Drop database after changing mode to single-user (to force disconnect of all other sessions)
-- (Taken from: https://docs.microsoft.com/en-us/sql/t-sql/statements/drop-database-transact-sql?view=sql-server-ver15)

use tempdb
go

drop procedure if exists evaldb_sp_Drop
go
create procedure evaldb_sp_Drop
as

    declare @sql nvarchar(1000);
    if exists (select 1 from sys.databases where [name] = N'evaldb')
    begin
        set @sql = N'USE [evaldb];
                    ALTER DATABASE evaldb SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
                    USE [tempdb];
                    DROP DATABASE evaldb;';
        exec(@sql);
    end;
go