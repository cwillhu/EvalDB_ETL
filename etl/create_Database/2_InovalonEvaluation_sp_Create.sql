
--####################################
-- Stored procedure to create database
--####################################

use master 

drop procedure if exists evaldb_sp_Create
go
create procedure evaldb_sp_Create
as

    create database [evaldb]
        ON PRIMARY 
        ( NAME = N'evaldb', FILENAME = N'I:\MSSQL\USER_DB\evaldb.mdf' , SIZE = 512000000KB , FILEGROWTH = 10%),
        ( NAME = N'evaldb1', FILENAME = N'I:\MSSQL\USER_DB\evaldb1.ndf' , SIZE = 512000000KB , FILEGROWTH = 10%),
        ( NAME = N'evaldb2', FILENAME = N'I:\MSSQL\USER_DB\evaldb2.ndf' , SIZE = 512000000KB , FILEGROWTH = 10%),
        ( NAME = N'evaldb3', FILENAME = N'I:\MSSQL\USER_DB\evaldb3.ndf' , SIZE = 512000000KB , FILEGROWTH = 10%),
        ( NAME = N'evaldb4', FILENAME = N'I:\MSSQL\USER_DB\evaldb4.ndf' , SIZE = 512000000KB , FILEGROWTH = 10%),
        ( NAME = N'evaldb5', FILENAME = N'I:\MSSQL\USER_DB\evaldb5.ndf' , SIZE = 512000000KB , FILEGROWTH = 10%),
        ( NAME = N'evaldb6', FILENAME = N'I:\MSSQL\USER_DB\evaldb6.ndf' , SIZE = 512000000KB , FILEGROWTH = 10%),
        ( NAME = N'evaldb7', FILENAME = N'I:\MSSQL\USER_DB\evaldb7.ndf' , SIZE = 512000000KB , FILEGROWTH = 10%),
        ( NAME = N'evaldb8', FILENAME = N'I:\MSSQL\USER_DB\evaldb8.ndf' , SIZE = 512000000KB , FILEGROWTH = 10%)
        LOG ON 
        ( NAME = N'evaldb_log', FILENAME = N'I:\MSSQL\USER_DB\evaldb_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )

        alter database evaldb set recovery simple
go

