use evaldb

drop procedure if exists tab02_sp_DropCreate
go
create procedure tab02_sp_DropCreate
    @tableName varchar(255),
    @fileID_flag int = 0  -- 1 for fileID, 0 for no fileID
as
    declare @dropcreate varchar(3000) = 
        'drop table if exists ' + @tableName + '
        create table ' + @tableName + '(
            lp3 bigint,
            mz1 bigint,
            mo6 bigint,
            mt1 varchar(1),
            dd9 date,
            yb9 date,
            wp1 varchar(2),
            pz6 int,
            ih9 int,
            pt4 decimal(19,4),
            fk4 decimal(19,4),
            bq5 decimal(19,4),
            nz1 decimal(19,4),
            cx1 decimal(19,4),
            ou3 int,
            nb3 int,
            sw6 int,
            qj4 int,
            fq2 int,
            ra6 varchar(1),
            gi2 varchar(1),
            ab3 varchar(1),
            df2 bigint,
            th1 bigint,
            qy1 varchar(15),
            uh7 varchar(15),
            jw7 date,
            pn2 varchar(64),
            nr5 varchar(20),
            oz6 date'

    if @fileID_flag = 1
    begin
        set @dropcreate += ', fileID int'
    end
    set @dropcreate += ')'

    execute (@dropcreate)
go

drop procedure if exists tab01_sp_DropCreate
go
create procedure tab01_sp_DropCreate
    @tableName varchar(255),
    @fileID_flag int = 0  -- 1 for fileID, 0 for no fileID
as
    declare @dropcreate varchar(3000) = 
        'drop table if exists ' + @tableName + '
        create table ' + @tableName + '(
            lp3 bigint,
            mz1 bigint,
            dd9 date,
            yb9 date,
            lt6 int,
            cz9 int,
            me8 varchar(11),
            tu6 int,
            oz6 date'

    if @fileID_flag = 1
    begin
        set @dropcreate += ', fileID int'
    end
    set @dropcreate += ')'

    execute (@dropcreate)
go

drop procedure if exists tab03_sp_DropCreate
go
create procedure tab03_sp_DropCreate
    @tableName varchar(255),
    @fileID_flag int = 0  -- 1 for fileID, 0 for no fileID
as
    declare @dropcreate varchar(3000) = 
        'drop table if exists ' + @tableName + '
        create table ' + @tableName + '(
            rj7 bigint,
            mz1 bigint,
            mo6 bigint,
            ir8 date,
            hk3 date,
            kk9 int,
            oh9 varchar(3),
            wp1 int,
            yd7 decimal(19,2),
            -- replaced double with float
            et1 float,
            sr1 decimal(19,2)'

    if @fileID_flag = 1
    begin
        set @dropcreate += ', fileID int'
    end
    set @dropcreate += ')'

    execute (@dropcreate)
go

drop procedure if exists tab04_sp_DropCreate
go
create procedure tab04_sp_DropCreate
    @tableName varchar(255),
    @fileID_flag int = 0  -- 1 for fileID, 0 for no fileID
as
    declare @dropcreate varchar(3000) = 
        'drop table if exists ' + @tableName + '
        create table ' + @tableName + '(
            mz1 bigint,
            rj7 bigint,
            hm6 int,
            lp3 bigint'

    if @fileID_flag = 1
    begin
        set @dropcreate += ', fileID int'
    end
    set @dropcreate += ')'

    execute (@dropcreate)
go

drop procedure if exists tab05_sp_DropCreate
go
create procedure tab05_sp_DropCreate
    @tableName varchar(255),
    @fileID_flag int = 0  -- 1 for fileID, 0 for no fileID
as
    declare @dropcreate varchar(3000) = 
        'drop table if exists ' + @tableName + '
        create table ' + @tableName + '(
            fl7 bigint,
            mz1 bigint,
            mo6 bigint,
            mt1 varchar(1),
            dd9 date,
            fm1 varchar(5),
            bd5 varchar(7),
            jd4 float,
            ed0 varchar(50),
            gx6 int,
            hu3 varchar(20),
            jw7 date,
            oz6 date'

    if @fileID_flag = 1
    begin
        set @dropcreate += ', fileID int'
    end
    set @dropcreate += ')'

    execute (@dropcreate)
go

drop procedure if exists tab07_sp_DropCreate
go
create procedure tab07_sp_DropCreate
    @tableName varchar(255),
    @fileID_flag int = 0  -- 1 for fileID, 0 for no fileID
as
    declare @dropcreate varchar(3000) = 
        'drop table if exists ' + @tableName + '
        create table ' + @tableName + '(
            mz1 bigint,
            bv2 int,
            gl5 varchar(1),
            rg9 varchar(2),
            is8 varchar(60),
            jz6 varchar(2),
            oz6 date'

    if @fileID_flag = 1
    begin
        set @dropcreate += ', fileID int'
    end
    set @dropcreate += ')'

    execute (@dropcreate)
go

drop procedure if exists tab06_sp_DropCreate
go
create procedure tab06_sp_DropCreate
    @tableName varchar(255),
    @fileID_flag int = 0  -- 1 for fileID, 0 for no fileID
as
    declare @dropcreate varchar(3000) = 
        'drop table if exists ' + @tableName + '
        create table ' + @tableName + '(
            mz1 bigint,
            on1 date,
            se8 date,
            aa9 varchar(1),
            ar3 varchar(2),
            mw9 varchar(1),
            ro5 int,
            lu1 int,
            bn8 int,
            ox7 varchar(2),
            eq1 varchar(3),
            xg8 int,
            ja0 varchar(2),
            ih7 int,
            sp1 int,
            ju5 varchar(2),
            fr8 int,
            oz6 date'

    if @fileID_flag = 1
    begin
        set @dropcreate += ', fileID int'
    end
    set @dropcreate += ')'

    execute (@dropcreate)
go

drop procedure if exists tab08_sp_DropCreate
go
create procedure tab08_sp_DropCreate
    @tableName varchar(255),
    @fileID_flag int = 0  -- 1 for fileID, 0 for no fileID
as
    declare @dropcreate varchar(3000) = 
        'drop table if exists ' + @tableName + '
        create table ' + @tableName + '(
            lp3 bigint,
            mz1 bigint,
            mo6 bigint,
            dd9 date,
            yb9 date,
            qd3 varchar(20),
            yd7 decimal(19,2),
            et1 float,
            ut5 decimal(19,2)'

    if @fileID_flag = 1
    begin
        set @dropcreate += ', fileID int'
    end
    set @dropcreate += ')'

    execute (@dropcreate)
go

drop procedure if exists tab09_sp_DropCreate
go
create procedure tab09_sp_DropCreate
    @tableName varchar(255),
    @fileID_flag int = 0  -- 1 for fileID, 0 for no fileID
as
    declare @dropcreate varchar(3000) = 
        'drop table if exists ' + @tableName + '
        create table ' + @tableName + '(
            mo6 int,
            gn6 varchar(50),
            gy8 varchar(50),
            vx2 varchar(50),
            cy9 varchar(100),
            sa2 varchar(10),
            zn0 varchar(1),
            ya0 varchar(100),
            fm0 varchar(10),
            ve8 varchar(1),
            hj1 varchar(100),
            ep0 varchar(50),
            fy6 varchar(50),
            zh0 varchar(50),
            gt7 varchar(2),
            eu3 varchar(5),
            pi8 varchar(4),
            vq5 varchar(10),
            gw7 varchar(50),
            om5 varchar(50),
            yt1 varchar(50),
            dw3 varchar(2),
            qi1 varchar(5),
            fe1 varchar(4),
            bz8 varchar(10),
            xp1 varchar(10),
            le2 varchar(100),
            bc9 varchar(100),
            wv0 varchar(100),
            ca6 varchar(10),
            qi9 varchar(100),
            xu0 varchar(100),
            lr9 varchar(100),
            oz6 date'

    if @fileID_flag = 1
    begin
        set @dropcreate += ', fileID int'
    end
    set @dropcreate += ')'

    execute (@dropcreate)
go

drop procedure if exists tab11_sp_DropCreate
go
create procedure tab11_sp_DropCreate
    @tableName varchar(255),
    @fileID_flag int = 0  -- 1 for fileID, 0 for no fileID
as
    declare @dropcreate varchar(3000) = 
        'drop table if exists ' + @tableName + '
        create table ' + @tableName + '(
            mo7 bigint,
            mz1 bigint,
            mo6 bigint,
            mt1 varchar(1),
            ss8 date,
            sz2 varchar(11),
            ct2 int,
            zs6 float,
            pt4 decimal(19,4),
            fk4 decimal(19,4),
            bq5 decimal(19,4),
            nz1 decimal(19,4),
            cx1 decimal(19,4),
            ep5 varchar(15),
            cj6 varchar(15),
            jw7 date,
            oz6 date'

    if @fileID_flag = 1
    begin
        set @dropcreate += ', fileID int'
    end
    set @dropcreate += ')'

    execute (@dropcreate)
go

drop procedure if exists tab10_sp_DropCreate
go
create procedure tab10_sp_DropCreate
    @tableName varchar(255),
    @fileID_flag int = 0  -- 1 for fileID, 0 for no fileID
as
    declare @dropcreate varchar(3000) = 
        'drop table if exists ' + @tableName + '
        create table ' + @tableName + '(
            tj3 bigint,
            mz1 bigint,
            ss8 date,
            sz2 varchar(20),
            ct2 int,
            od7 float,
            iq5 float'

    if @fileID_flag = 1
    begin
        set @dropcreate += ', fileID int'
    end
    set @dropcreate += ')'

    execute (@dropcreate)
go

drop procedure if exists tab12_sp_DropCreate
go
create procedure tab12_sp_DropCreate
    @tableName varchar(255),
    @fileID_flag int = 0  -- 1 for fileID, 0 for no fileID
as
    declare @dropcreate varchar(3000) = 
        'drop table if exists ' + @tableName + '
        create table ' + @tableName + '(
            mo7 bigint,
            tj3 bigint,
            mz1 int'

    if @fileID_flag = 1
    begin
        set @dropcreate += ', fileID int'
    end
    set @dropcreate += ')'

    execute (@dropcreate)
go
