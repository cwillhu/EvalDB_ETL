use evaldb

-- Create tables WITH fileID column 
-- (second arg to stored procedure is fileID_flag)

exec tab01_sp_DropCreate 'tab01', 1
exec tab02_sp_DropCreate 'tab02', 1
exec tab03_sp_DropCreate 'tab03', 1
exec tab04_sp_DropCreate 'tab04', 1
exec tab05_sp_DropCreate 'tab05', 1
exec tab06_sp_DropCreate 'tab06', 1
exec tab07_sp_DropCreate 'tab07', 1
exec tab08_sp_DropCreate 'tab08', 1
exec tab09_sp_DropCreate 'tab09', 1
exec tab10_sp_DropCreate 'tab10', 1
exec tab11_sp_DropCreate 'tab11', 1
exec tab12_sp_DropCreate 'tab12', 1
