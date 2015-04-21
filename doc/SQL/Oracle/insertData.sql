prompt PL/SQL Developer import file
prompt Created on 2015年4月21日 by Administrator
set feedback off
set define off
prompt Disabling triggers for B_PROJECT...
alter table B_PROJECT disable all triggers;
prompt Disabling triggers for C_B_PROJECT...
alter table C_B_PROJECT disable all triggers;
prompt Disabling triggers for C_B_TIME...
alter table C_B_TIME disable all triggers;
prompt Disabling triggers for C_B_VERSION...
alter table C_B_VERSION disable all triggers;
prompt Disabling triggers for C_INFO...
alter table C_INFO disable all triggers;
prompt Disabling triggers for C_REGIST...
alter table C_REGIST disable all triggers;
prompt Disabling triggers for SEARCH_BATCH...
alter table SEARCH_BATCH disable all triggers;
prompt Disabling triggers for SEARCH_RECORD...
alter table SEARCH_RECORD disable all triggers;
prompt Disabling triggers for SEARCH_RESULT...
alter table SEARCH_RESULT disable all triggers;
prompt Disabling triggers for SEARCH_RES_DETAIL...
alter table SEARCH_RES_DETAIL disable all triggers;
prompt Disabling triggers for S_CODE...
alter table S_CODE disable all triggers;
prompt Disabling triggers for S_PARA...
alter table S_PARA disable all triggers;
prompt Disabling triggers for U_TEMP_INFO...
alter table U_TEMP_INFO disable all triggers;
prompt Disabling triggers for Y_APPOINT...
alter table Y_APPOINT disable all triggers;
prompt Deleting Y_APPOINT...
delete from Y_APPOINT;
commit;
prompt Deleting U_TEMP_INFO...
delete from U_TEMP_INFO;
commit;
prompt Deleting S_PARA...
delete from S_PARA;
commit;
prompt Deleting S_CODE...
delete from S_CODE;
commit;
prompt Deleting SEARCH_RES_DETAIL...
delete from SEARCH_RES_DETAIL;
commit;
prompt Deleting SEARCH_RESULT...
delete from SEARCH_RESULT;
commit;
prompt Deleting SEARCH_RECORD...
delete from SEARCH_RECORD;
commit;
prompt Deleting SEARCH_BATCH...
delete from SEARCH_BATCH;
commit;
prompt Deleting C_REGIST...
delete from C_REGIST;
commit;
prompt Deleting C_INFO...
delete from C_INFO;
commit;
prompt Deleting C_B_VERSION...
delete from C_B_VERSION;
commit;
prompt Deleting C_B_TIME...
delete from C_B_TIME;
commit;
prompt Deleting C_B_PROJECT...
delete from C_B_PROJECT;
commit;
prompt Deleting B_PROJECT...
delete from B_PROJECT;
commit;
prompt Loading B_PROJECT...
insert into B_PROJECT (JFXMID, DJLX, XMBH, XMMC, BZ)
values ('3701BP150320212059100017', '01', 'qbjgs', '起步费', '(起始时间为准)');
insert into B_PROJECT (JFXMID, DJLX, XMBH, XMMC, BZ)
values ('3701BP150320212059100018', '01', 'lcjf', '里程费', '比如每公里费用或者超出指定公里后每公里费用');
insert into B_PROJECT (JFXMID, DJLX, XMBH, XMMC, BZ)
values ('3701BP150320212059100019', '01', 'hsjf', '耗时费', '比如每小时费用每超1小时费用');
insert into B_PROJECT (JFXMID, DJLX, XMBH, XMMC, BZ)
values ('3701BP150320212059100020', '01', 'mddjdwz', '目的地经度位置', '比如东二环外加收**元');
insert into B_PROJECT (JFXMID, DJLX, XMBH, XMMC, BZ)
values ('3701BP150320212059100025', '01', 'dlwz', '地理位置费', '比如在二环以外加收**元');
insert into B_PROJECT (JFXMID, DJLX, XMBH, XMMC, BZ)
values ('3701BP150320212059100021', '01', 'qbjge', '起步费', '(结束时间为准)');
insert into B_PROJECT (JFXMID, DJLX, XMBH, XMMC, BZ)
values ('3701BP150320212059100022', '01', 'mddwdwz', '目的地纬度位置', '比如南二环外加收**元');
insert into B_PROJECT (JFXMID, DJLX, XMBH, XMMC, BZ)
values ('3701BP150320212059100023', '01', 'cfdwdwz', '出发地纬度位置', null);
insert into B_PROJECT (JFXMID, DJLX, XMBH, XMMC, BZ)
values ('3701BP150320212059100024', '01', 'cfdjdwz', '出发地经度位置', null);
commit;
prompt 9 records loaded
prompt Loading C_B_PROJECT...
insert into C_B_PROJECT (JFBBID, JFXMID, JFBZZ, JFED, JFSJDID, JFXMBH, JFTJDW, JFTJXX, JFTJSX, JFBZDW, JFBZJSFF, BZ, SFBHXX, SFBHSX)
values ('3701CV150416210059100050', '3701BP150320212059100017', null, 58, '3701CT150416210059100052', 'qbjgs', null, null, null, null, null, null, null, null);
insert into C_B_PROJECT (JFBBID, JFXMID, JFBZZ, JFED, JFSJDID, JFXMBH, JFTJDW, JFTJXX, JFTJSX, JFBZDW, JFBZJSFF, BZ, SFBHXX, SFBHSX)
values ('3701CV150416210059100050', '3701BP150320212059100017', null, 38, '3701CT150416210059100051', 'qbjgs', null, null, null, null, null, null, null, null);
insert into C_B_PROJECT (JFBBID, JFXMID, JFBZZ, JFED, JFSJDID, JFXMBH, JFTJDW, JFTJXX, JFTJSX, JFBZDW, JFBZJSFF, BZ, SFBHXX, SFBHSX)
values ('3701CV150416210059100050', '3701BP150320212059100017', null, 78, '3701CT150416210059100053', 'qbjgs', null, null, null, null, null, null, null, null);
insert into C_B_PROJECT (JFBBID, JFXMID, JFBZZ, JFED, JFSJDID, JFXMBH, JFTJDW, JFTJXX, JFTJSX, JFBZDW, JFBZJSFF, BZ, SFBHXX, SFBHSX)
values ('3701CV150416210059100050', '3701BP150320212059100017', null, 98, '3701CT150416210059100054', 'qbjgs', null, null, null, null, null, null, null, null);
insert into C_B_PROJECT (JFBBID, JFXMID, JFBZZ, JFED, JFSJDID, JFXMBH, JFTJDW, JFTJXX, JFTJSX, JFBZDW, JFBZJSFF, BZ, SFBHXX, SFBHSX)
values ('3701CV150416210059100050', '3701BP150320212059100018', '10', 20, '3701CT150416210059100051', 'lcjf', '02', '10', null, '02', '01', null, null, null);
insert into C_B_PROJECT (JFBBID, JFXMID, JFBZZ, JFED, JFSJDID, JFXMBH, JFTJDW, JFTJXX, JFTJSX, JFBZDW, JFBZJSFF, BZ, SFBHXX, SFBHSX)
values ('3701CV150416210059100050', '3701BP150320212059100018', '10', 20, '3701CT150416210059100052', 'lcjf', '02', '10', null, '02', '01', null, null, null);
insert into C_B_PROJECT (JFBBID, JFXMID, JFBZZ, JFED, JFSJDID, JFXMBH, JFTJDW, JFTJXX, JFTJSX, JFBZDW, JFBZJSFF, BZ, SFBHXX, SFBHSX)
values ('3701CV150416210059100050', '3701BP150320212059100018', '10', 20, '3701CT150416210059100053', 'lcjf', '02', '10', null, '02', '01', null, null, null);
insert into C_B_PROJECT (JFBBID, JFXMID, JFBZZ, JFED, JFSJDID, JFXMBH, JFTJDW, JFTJXX, JFTJSX, JFBZDW, JFBZJSFF, BZ, SFBHXX, SFBHSX)
values ('3701CV150416210059100050', '3701BP150320212059100018', '10', 20, '3701CT150416210059100054', 'lcjf', '02', '10', null, '02', '01', null, null, null);
insert into C_B_PROJECT (JFBBID, JFXMID, JFBZZ, JFED, JFSJDID, JFXMBH, JFTJDW, JFTJXX, JFTJSX, JFBZDW, JFBZJSFF, BZ, SFBHXX, SFBHSX)
values ('3701CV150320205059100010', '3701BP150320212059100021', null, 80, '3701CT150320210059100011', 'qbjge', '04', '22:00', '23:59', null, null, null, '1', '1');
insert into C_B_PROJECT (JFBBID, JFXMID, JFBZZ, JFED, JFSJDID, JFXMBH, JFTJDW, JFTJXX, JFTJSX, JFBZDW, JFBZJSFF, BZ, SFBHXX, SFBHSX)
values ('3701CV150320205059100010', '3701BP150320212059100021', null, 60, '3701CT150320210059100011', 'qbjge', '04', '20:00', '21:59', null, null, null, '1', '1');
insert into C_B_PROJECT (JFBBID, JFXMID, JFBZZ, JFED, JFSJDID, JFXMBH, JFTJDW, JFTJXX, JFTJSX, JFBZDW, JFBZJSFF, BZ, SFBHXX, SFBHSX)
values ('3701CV150320205059100010', '3701BP150320212059100021', null, 50, '3701CT150320210059100011', 'qbjge', '04', '08:00', '19:59', null, null, null, '1', '1');
insert into C_B_PROJECT (JFBBID, JFXMID, JFBZZ, JFED, JFSJDID, JFXMBH, JFTJDW, JFTJXX, JFTJSX, JFBZDW, JFBZJSFF, BZ, SFBHXX, SFBHSX)
values ('3701CV150320205059100010', '3701BP150320212059100021', null, 110, '3701CT150320210059100011', 'qbjge', '04', '00:00', '07:59', null, null, null, '1', '1');
insert into C_B_PROJECT (JFBBID, JFXMID, JFBZZ, JFED, JFSJDID, JFXMBH, JFTJDW, JFTJXX, JFTJSX, JFBZDW, JFBZJSFF, BZ, SFBHXX, SFBHSX)
values ('3701CV150320205059100010', '3701BP150320212059100018', '5', 10, '3701CT150320210059100011', 'lcjf', '02', '10', null, '02', '01', null, '0', '1');
insert into C_B_PROJECT (JFBBID, JFXMID, JFBZZ, JFED, JFSJDID, JFXMBH, JFTJDW, JFTJXX, JFTJSX, JFBZDW, JFBZJSFF, BZ, SFBHXX, SFBHSX)
values ('3701CV150320205059100010', '3701BP150320212059100019', '30', 10, '3701CT150320210059100011', 'hsjf', '01', '60', null, '01', '01', null, '0', '1');
insert into C_B_PROJECT (JFBBID, JFXMID, JFBZZ, JFED, JFSJDID, JFXMBH, JFTJDW, JFTJXX, JFTJSX, JFBZDW, JFBZJSFF, BZ, SFBHXX, SFBHSX)
values ('3701CV150320205059100010', '3701BP150320212059100025', null, 20, '3701CT150320210059100011', 'dlwz', '03', '117.122846:36.603674:116.941317:36.732549', null, null, null, null, '0', '1');
commit;
prompt 15 records loaded
prompt Loading C_B_TIME...
insert into C_B_TIME (JFBBID, JFSJDID, QSSJ, ZZSJ, BZ)
values ('3701CV150416210059100050', '3701CT150416210059100051', '07:00', '21:59', null);
insert into C_B_TIME (JFBBID, JFSJDID, QSSJ, ZZSJ, BZ)
values ('3701CV150416210059100050', '3701CT150416210059100052', '22:00', '22:59', null);
insert into C_B_TIME (JFBBID, JFSJDID, QSSJ, ZZSJ, BZ)
values ('3701CV150416210059100050', '3701CT150416210059100053', '23:00', '23:59', null);
insert into C_B_TIME (JFBBID, JFSJDID, QSSJ, ZZSJ, BZ)
values ('3701CV150416210059100050', '3701CT150416210059100054', '00:00', '06:59', null);
insert into C_B_TIME (JFBBID, JFSJDID, QSSJ, ZZSJ, BZ)
values ('3701CV150320205059100010', '3701CT150320210059100011', '00:00', '23:59', null);
commit;
prompt 5 records loaded
prompt Loading C_B_VERSION...
insert into C_B_VERSION (JFBBID, GSID, DJLX, JFBBBH, JFMS, CJSJ, BZ, QTJFMS)
values ('3701CV150416210059100050', '3701GS150319203059100002', '01', '1.0', null, to_date('16-04-2015 21:12:15', 'dd-mm-yyyy hh24:mi:ss'), 'V代驾', null);
insert into C_B_VERSION (JFBBID, GSID, DJLX, JFBBBH, JFMS, CJSJ, BZ, QTJFMS)
values ('3701CV150320205059100010', '3701GS150319203059100001', '01', '1.0', '8:00-20:00 起步价50元，' || chr(10) || '20:00-22:00 起步价60元，' || chr(10) || '22:00-00:00起步价 80元，' || chr(10) || '00:00-8:00起步价110元' || chr(10) || '1.以上所指价格为济南市区10公里内，若超出10公里，每5公里加收10元，不足5公里按5公里计算。' || chr(10) || '2.每次代驾司机总的代驾时间为1小时，每超30分钟加收10元，不足30分钟按30分钟计算。', to_date('20-03-2015 20:52:25', 'dd-mm-yyyy hh24:mi:ss'), '途顺代驾', '1.等候：请至少提前30分钟预约，司机到达客户指定地点后免费等候30分钟，超过30分钟后，每30分钟加收10元，不足30分钟按30分钟计算' || chr(10) || '2.取消：预约后司机按时赶到，因故取消21:00前付20元，21:00后付40元（不包括等候费用）' || chr(10) || '3.如遇国家法定节假日，每单加收20-40元，如遇雨雪等恶劣天气，每单加收20元');
commit;
prompt 2 records loaded
prompt Loading C_INFO...
insert into C_INFO (GSID, GSBH, GSMC, GSFR, GSLXR, GSLXDH, BZ)
values ('3701GS150319203059100000', 'EDJ', 'E代驾', null, null, null, null);
insert into C_INFO (GSID, GSBH, GSMC, GSFR, GSLXR, GSLXDH, BZ)
values ('3701GS150319203059100001', 'TSDJ', '途顺代驾', null, null, null, null);
insert into C_INFO (GSID, GSBH, GSMC, GSFR, GSLXR, GSLXDH, BZ)
values ('3701GS150319203059100002', 'VDJ', 'V代驾', null, null, null, null);
commit;
prompt 3 records loaded
prompt Loading C_REGIST...
insert into C_REGIST (ZCID, GSID, DJLX, ZCZT, JFBBID, YXQ, BZ, YYLXR, YYLXDH)
values ('3701ZC150323203559100021', '3701GS150319203059100001', '01', '01', '3701CV150320205059100010', null, '途顺代驾', '刘老师', '18615206630');
insert into C_REGIST (ZCID, GSID, DJLX, ZCZT, JFBBID, YXQ, BZ, YYLXR, YYLXDH)
values ('3701ZC150319203059100055', '3701GS150319203059100002', '01', '01', '3701CV150416210059100050', null, null, '刘老师', '18615206630');
commit;
prompt 2 records loaded
prompt Loading SEARCH_BATCH...
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416231259100062', 'ldwtest', to_date('16-04-2015 23:12:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:59', 'dd-mm-yyyy hh24:mi:ss'), '南全福小区', '117.06448', '36.699507', '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:59', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416231747100068', 'ldwtest', to_date('16-04-2015 23:17:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:47', 'dd-mm-yyyy hh24:mi:ss'), '南全福小区', '117.06448', '36.699507', '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:47', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416231827100082', 'ldwtest', to_date('16-04-2015 23:18:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:27', 'dd-mm-yyyy hh24:mi:ss'), '南全福小区', '117.06448', '36.699507', '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:27', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416231913100086', 'ldwtest', to_date('16-04-2015 23:19:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:13', 'dd-mm-yyyy hh24:mi:ss'), '南全福小区', '117.06448', '36.699507', '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:13', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416232315100094', 'ldwtest', to_date('16-04-2015 23:23:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:50:15', 'dd-mm-yyyy hh24:mi:ss'), '南全福', '117.062934', '36.698617', '周村区', '117.875108', '36.771219', 78, 98, to_date('17-04-2015 01:08:15', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416235754100098', 'ldwtest', to_date('16-04-2015 23:57:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2015 00:30:54', 'dd-mm-yyyy hh24:mi:ss'), '南全福', '117.062934', '36.698617', '洪家楼天主教堂', '117.072066', '36.69181', 6, 3.2, to_date('17-04-2015 00:36:54', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150418092740100104', 'ldwtest', to_date('18-04-2015 09:27:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-04-2015 09:55:34', 'dd-mm-yyyy hh24:mi:ss'), '南全福', '117.062934', '36.698617', '洪家楼天主教堂', '117.072066', '36.69181', 9, 3.2, to_date('18-04-2015 10:04:34', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150418093018100114', 'ldwtest', to_date('18-04-2015 09:30:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-04-2015 09:55:18', 'dd-mm-yyyy hh24:mi:ss'), '南全福', '117.062934', '36.698617', '洪家楼天主教堂', '117.072066', '36.69181', 9, 3.2, to_date('18-04-2015 10:04:18', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150418093720100124', 'ldwtest', to_date('18-04-2015 09:37:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-04-2015 10:35:20', 'dd-mm-yyyy hh24:mi:ss'), '泉城花园', '116.948935', '36.681362', '章丘市人民医院', '117.545314', '36.720143', 69, 79.3, to_date('18-04-2015 11:44:20', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416230147100058', 'ldwtest', to_date('16-04-2015 23:01:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:25:45', 'dd-mm-yyyy hh24:mi:ss'), '南全福小区', '117.06448', '36.699507', '山东大学(洪家楼校区)', '117.075182', '36.693047', 6, 3.1, to_date('16-04-2015 23:31:45', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416231730100066', 'ldwtest', to_date('16-04-2015 23:17:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:30', 'dd-mm-yyyy hh24:mi:ss'), '南全福小区', '117.06448', '36.699507', '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:30', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416231748100070', 'ldwtest', to_date('16-04-2015 23:17:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:48', 'dd-mm-yyyy hh24:mi:ss'), '南全福小区', '117.06448', '36.699507', '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:48', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416231824100076', 'ldwtest', to_date('16-04-2015 23:18:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:24', 'dd-mm-yyyy hh24:mi:ss'), '南全福小区', '117.06448', '36.699507', '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:24', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416231825100078', 'ldwtest', to_date('16-04-2015 23:18:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:25', 'dd-mm-yyyy hh24:mi:ss'), '南全福小区', '117.06448', '36.699507', '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:25', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416231914100088', 'ldwtest', to_date('16-04-2015 23:19:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:14', 'dd-mm-yyyy hh24:mi:ss'), '南全福小区', '117.06448', '36.699507', '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:14', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416232318100096', 'ldwtest', to_date('16-04-2015 23:23:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:50:18', 'dd-mm-yyyy hh24:mi:ss'), '南全福', '117.062934', '36.698617', '周村区', '117.875108', '36.771219', 78, 98, to_date('17-04-2015 01:08:18', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416213019100056', 'ldwtest', to_date('16-04-2015 21:30:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2015 21:30:19', 'dd-mm-yyyy hh24:mi:ss'), '南全福', '117.062934', '36.698617', '刁镇', '117.51562', '36.889357', 41, 53.7, to_date('17-04-2015 22:11:19', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416230314100060', 'ldwtest', to_date('16-04-2015 23:03:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:10:14', 'dd-mm-yyyy hh24:mi:ss'), '南全福小区', '117.06448', '36.699507', '洪家楼-公交车站', '117.074773', '36.690327', 5, 2.9, to_date('16-04-2015 23:15:14', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416231826100080', 'ldwtest', to_date('16-04-2015 23:18:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:26', 'dd-mm-yyyy hh24:mi:ss'), '南全福小区', '117.06448', '36.699507', '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:26', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416232103100090', 'ldwtest', to_date('16-04-2015 23:21:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:03', 'dd-mm-yyyy hh24:mi:ss'), '南全福小区', '117.06448', '36.699507', '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:03', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416232159100092', 'ldwtest', to_date('16-04-2015 23:21:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:50:59', 'dd-mm-yyyy hh24:mi:ss'), '南全福', '117.062934', '36.698617', '周村区', '117.875108', '36.771219', 78, 98, to_date('17-04-2015 01:08:59', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416235839100101', 'ldwtest', to_date('16-04-2015 23:58:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2015 00:30:39', 'dd-mm-yyyy hh24:mi:ss'), '南全福', '117.062934', '36.698617', '洪家楼天主教堂', '117.072066', '36.69181', 6, 3.2, to_date('17-04-2015 00:36:39', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150418092910100109', 'ldwtest', to_date('18-04-2015 09:29:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-04-2015 09:55:09', 'dd-mm-yyyy hh24:mi:ss'), '南全福', '117.062934', '36.698617', '洪家楼天主教堂', '117.072066', '36.69181', 9, 3.2, to_date('18-04-2015 10:04:09', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416231511100064', 'ldwtest', to_date('16-04-2015 23:15:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:11', 'dd-mm-yyyy hh24:mi:ss'), '南全福小区', '117.06448', '36.699507', '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:11', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416231802100072', 'ldwtest', to_date('16-04-2015 23:18:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:02', 'dd-mm-yyyy hh24:mi:ss'), '南全福小区', '117.06448', '36.699507', '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:02', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416231852100084', 'ldwtest', to_date('16-04-2015 23:18:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:52', 'dd-mm-yyyy hh24:mi:ss'), '南全福小区', '117.06448', '36.699507', '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:52', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150418094418100126', 'ldwtest', to_date('18-04-2015 09:44:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-04-2015 10:35:18', 'dd-mm-yyyy hh24:mi:ss'), '泉城花园', '116.948935', '36.681362', '章丘市人民医院', '117.545314', '36.720143', 69, 79.3, to_date('18-04-2015 11:44:18', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150416231803100074', 'ldwtest', to_date('16-04-2015 23:18:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:03', 'dd-mm-yyyy hh24:mi:ss'), '南全福小区', '117.06448', '36.699507', '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:03', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150418092810100106', 'ldwtest', to_date('18-04-2015 09:28:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-04-2015 09:55:10', 'dd-mm-yyyy hh24:mi:ss'), '南全福', '117.062934', '36.698617', '洪家楼天主教堂', '117.072066', '36.69181', 9, 3.2, to_date('18-04-2015 10:04:10', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_BATCH (SSPCID, USERID, SSSJ, YYSJ, CFDMC, CFDJD, CFDWD, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SB150418093017100112', 'ldwtest', to_date('18-04-2015 09:30:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-04-2015 09:55:16', 'dd-mm-yyyy hh24:mi:ss'), '南全福', '117.062934', '36.698617', '洪家楼天主教堂', '117.072066', '36.69181', 9, 3.2, to_date('18-04-2015 10:04:16', 'dd-mm-yyyy hh24:mi:ss'), null);
commit;
prompt 30 records loaded
prompt Loading SEARCH_RECORD...
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416231259100063', '3701SB150416231259100062', to_date('16-04-2015 23:12:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:59', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:59', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416231747100069', '3701SB150416231747100068', to_date('16-04-2015 23:17:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:47', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:47', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416231827100083', '3701SB150416231827100082', to_date('16-04-2015 23:18:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:27', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:27', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416231913100087', '3701SB150416231913100086', to_date('16-04-2015 23:19:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:13', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:13', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416232315100095', '3701SB150416232315100094', to_date('16-04-2015 23:23:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:50:15', 'dd-mm-yyyy hh24:mi:ss'), '周村区', '117.875108', '36.771219', 78, 98, to_date('17-04-2015 01:08:15', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416235754100099', '3701SB150416235754100098', to_date('16-04-2015 23:57:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2015 00:30:54', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 6, 3.2, to_date('17-04-2015 00:36:54', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150418092741100105', '3701SB150418092740100104', to_date('18-04-2015 09:27:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-04-2015 09:55:34', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 9, 3.2, to_date('18-04-2015 10:04:34', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150418093018100115', '3701SB150418093018100114', to_date('18-04-2015 09:30:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-04-2015 09:55:18', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 9, 3.2, to_date('18-04-2015 10:04:18', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150418093720100125', '3701SB150418093720100124', to_date('18-04-2015 09:37:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-04-2015 10:35:20', 'dd-mm-yyyy hh24:mi:ss'), '章丘市人民医院', '117.545314', '36.720143', 69, 79.3, to_date('18-04-2015 11:44:20', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416230147100059', '3701SB150416230147100058', to_date('16-04-2015 23:01:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:25:45', 'dd-mm-yyyy hh24:mi:ss'), '山东大学(洪家楼校区)', '117.075182', '36.693047', 6, 3.1, to_date('16-04-2015 23:31:45', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416231730100067', '3701SB150416231730100066', to_date('16-04-2015 23:17:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:30', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:30', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416231748100071', '3701SB150416231748100070', to_date('16-04-2015 23:17:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:48', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:48', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416231824100077', '3701SB150416231824100076', to_date('16-04-2015 23:18:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:24', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:24', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416231825100079', '3701SB150416231825100078', to_date('16-04-2015 23:18:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:25', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:25', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416231914100089', '3701SB150416231914100088', to_date('16-04-2015 23:19:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:14', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:14', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416232318100097', '3701SB150416232318100096', to_date('16-04-2015 23:23:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:50:18', 'dd-mm-yyyy hh24:mi:ss'), '周村区', '117.875108', '36.771219', 78, 98, to_date('17-04-2015 01:08:18', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416213020100057', '3701SB150416213019100056', to_date('16-04-2015 21:30:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2015 21:30:19', 'dd-mm-yyyy hh24:mi:ss'), '刁镇', '117.51562', '36.889357', 41, 53.7, to_date('17-04-2015 22:11:19', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416230314100061', '3701SB150416230314100060', to_date('16-04-2015 23:03:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:10:14', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼-公交车站', '117.074773', '36.690327', 5, 2.9, to_date('16-04-2015 23:15:14', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416231826100081', '3701SB150416231826100080', to_date('16-04-2015 23:18:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:26', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:26', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416232103100091', '3701SB150416232103100090', to_date('16-04-2015 23:21:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:03', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:03', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416232159100093', '3701SB150416232159100092', to_date('16-04-2015 23:21:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:50:59', 'dd-mm-yyyy hh24:mi:ss'), '周村区', '117.875108', '36.771219', 78, 98, to_date('17-04-2015 01:08:59', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416235839100102', '3701SB150416235839100101', to_date('16-04-2015 23:58:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2015 00:30:39', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 6, 3.2, to_date('17-04-2015 00:36:39', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150418092910100110', '3701SB150418092910100109', to_date('18-04-2015 09:29:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-04-2015 09:55:09', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 9, 3.2, to_date('18-04-2015 10:04:09', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416231511100065', '3701SB150416231511100064', to_date('16-04-2015 23:15:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:11', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:11', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416231802100073', '3701SB150416231802100072', to_date('16-04-2015 23:18:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:02', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:02', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416231852100085', '3701SB150416231852100084', to_date('16-04-2015 23:18:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:52', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:52', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150418094418100127', '3701SB150418094418100126', to_date('18-04-2015 09:44:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-04-2015 10:35:18', 'dd-mm-yyyy hh24:mi:ss'), '章丘市人民医院', '117.545314', '36.720143', 69, 79.3, to_date('18-04-2015 11:44:18', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150416231803100075', '3701SB150416231803100074', to_date('16-04-2015 23:18:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('16-04-2015 23:55:03', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 6, 3, to_date('17-04-2015 00:01:03', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150418092810100107', '3701SB150418092810100106', to_date('18-04-2015 09:28:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-04-2015 09:55:10', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 9, 3.2, to_date('18-04-2015 10:04:10', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SEARCH_RECORD (SSJLID, SSPCID, SSSJ, YYSJ, MDDMC, MDDJD, MDDWD, YGHS, YGJL, DDSJ, BZ)
values ('3701SR150418093017100113', '3701SB150418093017100112', to_date('18-04-2015 09:30:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-04-2015 09:55:16', 'dd-mm-yyyy hh24:mi:ss'), '洪家楼天主教堂', '117.072066', '36.69181', 9, 3.2, to_date('18-04-2015 10:04:16', 'dd-mm-yyyy hh24:mi:ss'), null);
commit;
prompt 30 records loaded
prompt Loading SEARCH_RESULT...
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231259100063', '3701GS150319203059100002', '3701SB150416231259100062', 78, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231259100063', '3701GS150319203059100001', '3701SB150416231259100062', 110, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231747100069', '3701GS150319203059100002', '3701SB150416231747100068', 78, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231747100069', '3701GS150319203059100001', '3701SB150416231747100068', 110, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231827100083', '3701GS150319203059100002', '3701SB150416231827100082', 78, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231827100083', '3701GS150319203059100001', '3701SB150416231827100082', 110, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231913100087', '3701GS150319203059100002', '3701SB150416231913100086', 78, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231913100087', '3701GS150319203059100001', '3701SB150416231913100086', 110, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416232315100095', '3701GS150319203059100002', '3701SB150416232315100094', 258, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416232315100095', '3701GS150319203059100001', '3701SB150416232315100094', 320, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416235754100099', '3701GS150319203059100002', '3701SB150416235754100098', 98, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416235754100099', '3701GS150319203059100001', '3701SB150416235754100098', 110, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150418092741100105', '3701GS150319203059100002', '3701SB150418092740100104', 38, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150418092741100105', '3701GS150319203059100001', '3701SB150418092740100104', 50, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150418093018100115', '3701GS150319203059100002', '3701SB150418093018100114', 38, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150418093018100115', '3701GS150319203059100001', '3701SB150418093018100114', 50, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150418093720100125', '3701GS150319203059100002', '3701SB150418093720100124', 178, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150418093720100125', '3701GS150319203059100001', '3701SB150418093720100124', 220, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416230147100059', '3701GS150319203059100002', '3701SB150416230147100058', 78, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416230147100059', '3701GS150319203059100001', '3701SB150416230147100058', 80, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231730100067', '3701GS150319203059100002', '3701SB150416231730100066', 78, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231730100067', '3701GS150319203059100001', '3701SB150416231730100066', 110, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231748100071', '3701GS150319203059100002', '3701SB150416231748100070', 78, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231748100071', '3701GS150319203059100001', '3701SB150416231748100070', 110, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231824100077', '3701GS150319203059100002', '3701SB150416231824100076', 78, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231824100077', '3701GS150319203059100001', '3701SB150416231824100076', 110, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231825100079', '3701GS150319203059100002', '3701SB150416231825100078', 78, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231825100079', '3701GS150319203059100001', '3701SB150416231825100078', 110, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231914100089', '3701GS150319203059100002', '3701SB150416231914100088', 78, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231914100089', '3701GS150319203059100001', '3701SB150416231914100088', 110, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416232318100097', '3701GS150319203059100002', '3701SB150416232318100096', 258, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416232318100097', '3701GS150319203059100001', '3701SB150416232318100096', 320, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416213020100057', '3701GS150319203059100002', '3701SB150416213019100056', 138, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416213020100057', '3701GS150319203059100001', '3701SB150416213019100056', 190, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416230314100061', '3701GS150319203059100002', '3701SB150416230314100060', 78, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416230314100061', '3701GS150319203059100001', '3701SB150416230314100060', 80, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231826100081', '3701GS150319203059100002', '3701SB150416231826100080', 78, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231826100081', '3701GS150319203059100001', '3701SB150416231826100080', 110, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416232103100091', '3701GS150319203059100002', '3701SB150416232103100090', 78, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416232103100091', '3701GS150319203059100001', '3701SB150416232103100090', 110, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416232159100093', '3701GS150319203059100002', '3701SB150416232159100092', 258, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416232159100093', '3701GS150319203059100001', '3701SB150416232159100092', 320, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416235839100102', '3701GS150319203059100002', '3701SB150416235839100101', 98, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416235839100102', '3701GS150319203059100001', '3701SB150416235839100101', 110, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150418092910100110', '3701GS150319203059100002', '3701SB150418092910100109', 38, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150418092910100110', '3701GS150319203059100001', '3701SB150418092910100109', 50, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231511100065', '3701GS150319203059100002', '3701SB150416231511100064', 78, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231511100065', '3701GS150319203059100001', '3701SB150416231511100064', 110, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231802100073', '3701GS150319203059100002', '3701SB150416231802100072', 78, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231802100073', '3701GS150319203059100001', '3701SB150416231802100072', 110, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231852100085', '3701GS150319203059100002', '3701SB150416231852100084', 78, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231852100085', '3701GS150319203059100001', '3701SB150416231852100084', 110, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150418094418100127', '3701GS150319203059100002', '3701SB150418094418100126', 178, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150418094418100127', '3701GS150319203059100001', '3701SB150418094418100126', 220, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231803100075', '3701GS150319203059100002', '3701SB150416231803100074', 78, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150416231803100075', '3701GS150319203059100001', '3701SB150416231803100074', 110, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150418092810100107', '3701GS150319203059100002', '3701SB150418092810100106', 38, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150418092810100107', '3701GS150319203059100001', '3701SB150418092810100106', 50, 2, '3701CV150320205059100010', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150418093017100113', '3701GS150319203059100002', '3701SB150418093017100112', 38, 1, '3701CV150416210059100050', null);
insert into SEARCH_RESULT (SSJLID, GSID, SSPCID, GSJG, SSPM, JFBBID, BZ)
values ('3701SR150418093017100113', '3701GS150319203059100001', '3701SB150418093017100112', 50, 2, '3701CV150320205059100010', null);
commit;
prompt 60 records loaded
prompt Loading SEARCH_RES_DETAIL...
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231259100063', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231259100063', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231747100069', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231747100069', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231827100083', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231827100083', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231913100087', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231913100087', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232315100095', '3701GS150319203059100001', '3701BP150320212059100018', '3701CV150320205059100010', 180, '(98.0 - 10.0) * 10元/5.0公里', null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232315100095', '3701GS150319203059100001', '3701BP150320212059100019', '3701CV150320205059100010', 10, '(78 - 60.0) * 10元/30.0分钟', null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232315100095', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232315100095', '3701GS150319203059100001', '3701BP150320212059100025', '3701CV150320205059100010', 20, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232315100095', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232315100095', '3701GS150319203059100002', '3701BP150320212059100018', '3701CV150416210059100050', 180, '(98.0 - 10.0) * 20元/10.0公里', null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416235754100099', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416235754100099', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 98, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418092741100105', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 50, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418092741100105', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 38, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418093018100115', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 50, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418093018100115', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 38, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418093720100125', '3701GS150319203059100001', '3701BP150320212059100018', '3701CV150320205059100010', 140, '(79.3 - 10.0) * 10元/5.0公里', null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418093720100125', '3701GS150319203059100001', '3701BP150320212059100019', '3701CV150320205059100010', 10, '(69 - 60.0) * 10元/30.0分钟', null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418093720100125', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 50, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418093720100125', '3701GS150319203059100001', '3701BP150320212059100025', '3701CV150320205059100010', 20, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418093720100125', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 38, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418093720100125', '3701GS150319203059100002', '3701BP150320212059100018', '3701CV150416210059100050', 140, '(79.3 - 10.0) * 20元/10.0公里', null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416230147100059', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 80, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416230147100059', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231730100067', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231730100067', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231748100071', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231748100071', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231824100077', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231824100077', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231825100079', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231825100079', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231914100089', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231914100089', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232318100097', '3701GS150319203059100001', '3701BP150320212059100018', '3701CV150320205059100010', 180, '(98.0 - 10.0) * 10元/5.0公里', null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232318100097', '3701GS150319203059100001', '3701BP150320212059100019', '3701CV150320205059100010', 10, '(78 - 60.0) * 10元/30.0分钟', null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232318100097', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232318100097', '3701GS150319203059100001', '3701BP150320212059100025', '3701CV150320205059100010', 20, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232318100097', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232318100097', '3701GS150319203059100002', '3701BP150320212059100018', '3701CV150416210059100050', 180, '(98.0 - 10.0) * 20元/10.0公里', null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416213020100057', '3701GS150319203059100001', '3701BP150320212059100018', '3701CV150320205059100010', 90, '(53.7 - 10.0) * 10元/5.0公里', null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416213020100057', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 80, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416213020100057', '3701GS150319203059100001', '3701BP150320212059100025', '3701CV150320205059100010', 20, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416213020100057', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 38, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416213020100057', '3701GS150319203059100002', '3701BP150320212059100018', '3701CV150416210059100050', 100, '(53.7 - 10.0) * 20元/10.0公里', null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416230314100061', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 80, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416230314100061', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231826100081', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231826100081', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232103100091', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232103100091', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232159100093', '3701GS150319203059100001', '3701BP150320212059100018', '3701CV150320205059100010', 180, '(98.0 - 10.0) * 10元/5.0公里', null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232159100093', '3701GS150319203059100001', '3701BP150320212059100019', '3701CV150320205059100010', 10, '(78 - 60.0) * 10元/30.0分钟', null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232159100093', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232159100093', '3701GS150319203059100001', '3701BP150320212059100025', '3701CV150320205059100010', 20, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232159100093', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416232159100093', '3701GS150319203059100002', '3701BP150320212059100018', '3701CV150416210059100050', 180, '(98.0 - 10.0) * 20元/10.0公里', null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416235839100102', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416235839100102', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 98, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418092910100110', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 50, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418092910100110', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 38, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231511100065', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231511100065', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231802100073', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231802100073', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231852100085', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231852100085', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418094418100127', '3701GS150319203059100001', '3701BP150320212059100018', '3701CV150320205059100010', 140, '(79.3 - 10.0) * 10元/5.0公里', null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418094418100127', '3701GS150319203059100001', '3701BP150320212059100019', '3701CV150320205059100010', 10, '(69 - 60.0) * 10元/30.0分钟', null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418094418100127', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 50, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418094418100127', '3701GS150319203059100001', '3701BP150320212059100025', '3701CV150320205059100010', 20, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418094418100127', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 38, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418094418100127', '3701GS150319203059100002', '3701BP150320212059100018', '3701CV150416210059100050', 140, '(79.3 - 10.0) * 20元/10.0公里', null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231803100075', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 110, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150416231803100075', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 78, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418092810100107', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 50, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418092810100107', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 38, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418093017100113', '3701GS150319203059100001', '3701BP150320212059100021', '3701CV150320205059100010', 50, null, null);
insert into SEARCH_RES_DETAIL (SSJLID, GSID, JFXMID, JFBBID, XMFY, XMFYMS, BZ)
values ('3701SR150418093017100113', '3701GS150319203059100002', '3701BP150320212059100017', '3701CV150416210059100050', 38, null, null);
commit;
prompt 83 records loaded
prompt Loading S_CODE...
insert into S_CODE (DMID, DMLX, DMMC, DMZ, XSSX)
values ('DJLX01', 'DJLX', '酒后代驾', '01', '1');
insert into S_CODE (DMID, DMLX, DMMC, DMZ, XSSX)
values ('DJLX02', 'DJLX', '商务代驾', '02', '2');
insert into S_CODE (DMID, DMLX, DMMC, DMZ, XSSX)
values ('JFXMDW01', 'JFXMDW', '分钟', '01', '1');
insert into S_CODE (DMID, DMLX, DMMC, DMZ, XSSX)
values ('JFXMDW02', 'JFXMDW', '公里', '02', '2');
insert into S_CODE (DMID, DMLX, DMMC, DMZ, XSSX)
values ('JFXMDW03', 'JFXMDW', '经纬度', '03', '3');
insert into S_CODE (DMID, DMLX, DMMC, DMZ, XSSX)
values ('JSFF01', 'JSFF', '上取整', '01', '1');
insert into S_CODE (DMID, DMLX, DMMC, DMZ, XSSX)
values ('JSFF02', 'JSFF', '四舍五入', '02', '2');
insert into S_CODE (DMID, DMLX, DMMC, DMZ, XSSX)
values ('JSFF03', 'JSFF', '下取整', '03', '3');
insert into S_CODE (DMID, DMLX, DMMC, DMZ, XSSX)
values ('SF01', 'SF', '是', '1', '1');
insert into S_CODE (DMID, DMLX, DMMC, DMZ, XSSX)
values ('SF02', 'SF', '否', '0', '2');
insert into S_CODE (DMID, DMLX, DMMC, DMZ, XSSX)
values ('ZCZT01', 'ZCZT', '有效', '01', '1');
insert into S_CODE (DMID, DMLX, DMMC, DMZ, XSSX)
values ('ZCZT02', 'ZCZT', '暂停', '02', '2');
insert into S_CODE (DMID, DMLX, DMMC, DMZ, XSSX)
values ('ZCZT03', 'ZCZT', '注销', '03', '3');
insert into S_CODE (DMID, DMLX, DMMC, DMZ, XSSX)
values ('YYLY01', 'YYLY', '搜索', '01', '1');
insert into S_CODE (DMID, DMLX, DMMC, DMZ, XSSX)
values ('YYLY02', 'YYLY', '收藏', '02', '2');
insert into S_CODE (DMID, DMLX, DMMC, DMZ, XSSX)
values ('JFXMDW04', 'JFXMDW', '时间', '04', '4');
commit;
prompt 16 records loaded
prompt Loading S_PARA...
insert into S_PARA (CSID, CSBH, CSZ, BZ)
values ('dbid', 'dbid', '3701', '数据库标记（济南）');
commit;
prompt 1 records loaded
prompt Loading U_TEMP_INFO...
prompt Table is empty
prompt Loading Y_APPOINT...
insert into Y_APPOINT (YYJLID, GSID, USERID, YYLY, YYLYDX, YYLXR, YYLXRDH, CZSJ, DJLX, BZ)
values ('3701YA150418092825100108', '3701GS150319203059100002', 'ldwtest', '01', '3701SR150418092810100107', '刘老师', '18615206630', to_date('18-04-2015 09:28:26', 'dd-mm-yyyy hh24:mi:ss'), '01', null);
insert into Y_APPOINT (YYJLID, GSID, USERID, YYLY, YYLYDX, YYLXR, YYLXRDH, CZSJ, DJLX, BZ)
values ('3701YA150416235759100100', '3701GS150319203059100001', 'ldwtest', '01', '3701SR150416235754100099', null, null, to_date('16-04-2015 23:58:00', 'dd-mm-yyyy hh24:mi:ss'), '01', null);
insert into Y_APPOINT (YYJLID, GSID, USERID, YYLY, YYLYDX, YYLXR, YYLXRDH, CZSJ, DJLX, BZ)
values ('3701YA150418093021100116', '3701GS150319203059100001', 'ldwtest', '01', '3701SR150418093018100115', '刘老师', '18615206630', to_date('18-04-2015 09:30:21', 'dd-mm-yyyy hh24:mi:ss'), '01', null);
insert into Y_APPOINT (YYJLID, GSID, USERID, YYLY, YYLYDX, YYLXR, YYLXRDH, CZSJ, DJLX, BZ)
values ('3701YA150416235841100103', '3701GS150319203059100001', 'ldwtest', '01', '3701SR150416235839100102', null, '18615206630', to_date('16-04-2015 23:58:41', 'dd-mm-yyyy hh24:mi:ss'), '01', null);
insert into Y_APPOINT (YYJLID, GSID, USERID, YYLY, YYLYDX, YYLXR, YYLXRDH, CZSJ, DJLX, BZ)
values ('3701YA150418092924100111', '3701GS150319203059100002', 'ldwtest', '01', '3701SR150418092910100110', '刘老师', '18615206630', to_date('18-04-2015 09:29:24', 'dd-mm-yyyy hh24:mi:ss'), '01', null);
commit;
prompt 5 records loaded
prompt Enabling triggers for B_PROJECT...
alter table B_PROJECT enable all triggers;
prompt Enabling triggers for C_B_PROJECT...
alter table C_B_PROJECT enable all triggers;
prompt Enabling triggers for C_B_TIME...
alter table C_B_TIME enable all triggers;
prompt Enabling triggers for C_B_VERSION...
alter table C_B_VERSION enable all triggers;
prompt Enabling triggers for C_INFO...
alter table C_INFO enable all triggers;
prompt Enabling triggers for C_REGIST...
alter table C_REGIST enable all triggers;
prompt Enabling triggers for SEARCH_BATCH...
alter table SEARCH_BATCH enable all triggers;
prompt Enabling triggers for SEARCH_RECORD...
alter table SEARCH_RECORD enable all triggers;
prompt Enabling triggers for SEARCH_RESULT...
alter table SEARCH_RESULT enable all triggers;
prompt Enabling triggers for SEARCH_RES_DETAIL...
alter table SEARCH_RES_DETAIL enable all triggers;
prompt Enabling triggers for S_CODE...
alter table S_CODE enable all triggers;
prompt Enabling triggers for S_PARA...
alter table S_PARA enable all triggers;
prompt Enabling triggers for U_TEMP_INFO...
alter table U_TEMP_INFO enable all triggers;
prompt Enabling triggers for Y_APPOINT...
alter table Y_APPOINT enable all triggers;
set feedback on
set define on
prompt Done.
