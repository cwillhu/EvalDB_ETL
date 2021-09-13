use evaldb;
set nocount on

--##################################################################
-- Create table tableInfo containing misc info for each data table 
--##################################################################

drop table if exists tableInfo
create table tableInfo (
  tableName nvarchar(255), 
  numFiles int default null,
  processed int default 0,
  colNames_NoFileID varchar(3000)
)

insert into tableInfo (tableName, colNames_NoFileID) values (
  'tab02',
  'lp3, \
  mz1, \
  mo6, \
  mt1, \
  dd9, \
  yb9, \
  wp1, \
  pz6, \
  ih9, \
  pt4, \
  fk4, \
  bq5, \
  nz1, \
  cx1, \
  ou3, \
  nb3, \
  sw6, \
  qj4, \
  fq2, \
  ra6, \
  gi2, \
  ab3, \
  df2, \
  th1, \
  qy1, \
  uh7, \
  jw7, \
  pn2, \
  nr5, \
  oz6'
)

insert into tableInfo (tableName, colNames_NoFileID) values (
  'tab01',
  'lp3, \
  mz1, \
  dd9, \
  yb9, \
  lt6, \
  cz9, \
  me8, \
  tu6, \
  oz6'
)

insert into tableInfo (tableName, colNames_NoFileID) values (
  'tab03',
  'rj7, \
  mz1, \
  mo6, \
  ir8, \
  hk3, \
  kk9, \
  oh9, \
  wp1, \
  yd7, \
  et1, \
  sr1'
)

insert into tableInfo (tableName, colNames_NoFileID) values (
  'tab04',
  'mz1, \
  rj7, \
  hm6, \
  lp3'
)

insert into tableInfo (tableName, colNames_NoFileID) values (
  'tab05',
  'fl7, \
  mz1, \
  mo6, \
  mt1, \
  dd9, \
  fm1, \
  bd5, \
  jd4, \
  ed0, \
  gx6, \
  hu3, \
  jw7, \
  oz6'
)

insert into tableInfo (tableName, colNames_NoFileID) values (
  'tab07',
  'mz1, \
  bv2, \
  gl5, \
  rg9, \
  is8, \
  jz6, \
  oz6'
)

insert into tableInfo (tableName, colNames_NoFileID) values (
  'tab06',
  'mz1, \
  on1, \
  se8, \
  aa9, \
  ar3, \
  mw9, \
  ro5, \
  lu1, \
  bn8, \
  ox7, \
  eq1, \
  xg8, \
  ja0, \
  ih7, \
  sp1, \
  ju5, \
  fr8, \
  oz6'
)

insert into tableInfo (tableName, colNames_NoFileID) values (
  'tab08',
  'lp3, \
  mz1, \
  mo6, \
  dd9, \
  yb9, \
  qd3, \
  yd7, \
  et1, \
  ut5'
)

insert into tableInfo (tableName, colNames_NoFileID) values (
  'tab09',
  'mo6, \
  gn6, \
  gy8, \
  vx2, \
  cy9, \
  sa2, \
  zn0, \
  ya0, \
  fm0, \
  ve8, \
  hj1, \
  ep0, \
  fy6, \
  zh0, \
  gt7, \
  eu3, \
  pi8, \
  vq5, \
  gw7, \
  om5, \
  yt1, \
  dw3, \
  qi1, \
  fe1, \
  bz8, \
  xp1, \
  le2, \
  bc9, \
  wv0, \
  ca6, \
  qi9, \
  xu0, \
  lr9, \
  oz6'
)

insert into tableInfo (tableName, colNames_NoFileID) values (
  'tab11',
  'mo7, \
  mz1, \
  mo6, \
  mt1, \
  ss8, \
  sz2, \
  ct2, \
  zs6, \
  pt4, \
  fk4, \
  bq5, \
  nz1, \
  cx1, \
  ep5, \
  cj6, \
  jw7, \
  oz6'
)

insert into tableInfo (tableName, colNames_NoFileID) values (
  'tab10',
  'tj3, \
  mz1, \
  ss8, \
  sz2, \
  ct2, \
  od7, \
  iq5'
)

insert into tableInfo (tableName, colNames_NoFileID) values (
  'tab12',
   'mo7, \
   tj3, \
   mz1'
)



