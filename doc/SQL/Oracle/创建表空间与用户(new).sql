create tablespace ts_ds
datafile 'E:\oracledata\tianxian\ts_ds_1.dbf' size 128M;

create tablespace tsi_ds
datafile 'E:\oracledata\tianxian\tsi_ds_1.dbf' size 128M;


create user ds identified by ds default tablespace ts_ds;

grant dba to ds;
grant connect to ds;
grant resource to ds;
grant select any table to ds;
grant insert any table to ds;
grant update any table to ds;
grant delete any table to ds;
grant create any table to ds;
grant create any index to ds;
grant select any sequence to ds;
grant create any view to ds;
