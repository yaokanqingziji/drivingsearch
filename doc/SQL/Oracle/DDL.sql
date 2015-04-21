-----------------------------------------------------
-- Export file for user DS                         --
-- Created by Administrator on 2015/4/21, 14:27:12 --
-----------------------------------------------------

spool ds.log

prompt
prompt Creating table B_PROJECT
prompt ========================
prompt
create table DS.B_PROJECT
(
  JFXMID VARCHAR2(30) not null,
  DJLX   VARCHAR2(3),
  XMBH   VARCHAR2(10),
  XMMC   VARCHAR2(50),
  BZ     VARCHAR2(500)
)
tablespace TS_DS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DS.B_PROJECT
  is '计费项目';
comment on column DS.B_PROJECT.JFXMID
  is '计费项目ID';
comment on column DS.B_PROJECT.DJLX
  is '代驾类型：01酒后代驾。02商务代驾';
comment on column DS.B_PROJECT.XMBH
  is '项目编号';
comment on column DS.B_PROJECT.XMMC
  is '项目名称';
comment on column DS.B_PROJECT.BZ
  is '备注';
alter table DS.B_PROJECT
  add constraint PK_B_PROJECT primary key (JFXMID)
  using index 
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DS.IDX_B_PROJECT_01 on DS.B_PROJECT (XMBH)
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table C_B_PROJECT
prompt ==========================
prompt
create table DS.C_B_PROJECT
(
  JFBBID   VARCHAR2(30),
  JFXMID   VARCHAR2(30),
  JFBZZ    VARCHAR2(30),
  JFED     NUMBER(12,2),
  JFSJDID  VARCHAR2(30),
  JFXMBH   VARCHAR2(10),
  JFTJDW   VARCHAR2(3),
  JFTJXX   VARCHAR2(50),
  JFTJSX   VARCHAR2(50),
  JFBZDW   VARCHAR2(3),
  JFBZJSFF VARCHAR2(3),
  BZ       VARCHAR2(500),
  SFBHXX   VARCHAR2(3),
  SFBHSX   VARCHAR2(3)
)
tablespace TS_DS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DS.C_B_PROJECT
  is '公司计费标准';
comment on column DS.C_B_PROJECT.JFBBID
  is '计费版本ID';
comment on column DS.C_B_PROJECT.JFXMID
  is '计费项目ID';
comment on column DS.C_B_PROJECT.JFBZZ
  is '计费标准值，比如每30分钟，就输入30';
comment on column DS.C_B_PROJECT.JFED
  is '费用额度(元)';
comment on column DS.C_B_PROJECT.JFSJDID
  is '计费时间段ID';
comment on column DS.C_B_PROJECT.JFXMBH
  is '计费项目编号';
comment on column DS.C_B_PROJECT.JFTJDW
  is '计费条件单位，比如时间，公里，经纬度';
comment on column DS.C_B_PROJECT.JFTJXX
  is '计费条件下限';
comment on column DS.C_B_PROJECT.JFTJSX
  is '计费条件上限';
comment on column DS.C_B_PROJECT.JFBZDW
  is '计费标准单位，比如：分钟、公里';
comment on column DS.C_B_PROJECT.JFBZJSFF
  is '计费标准计数方法，比如：上取整、下取整、四舍五入';
comment on column DS.C_B_PROJECT.BZ
  is '备注';
comment on column DS.C_B_PROJECT.SFBHXX
  is '是否包含计费条件下限值，1包含 0不包含';
comment on column DS.C_B_PROJECT.SFBHSX
  is '是否包含计费条件上限值，1包含 0不包含';
create index DS.IDX_C_B_PRO_01 on DS.C_B_PROJECT (JFBBID)
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DS.IDX_C_B_PRO_02 on DS.C_B_PROJECT (JFXMID)
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DS.IDX_C_B_PRO_03 on DS.C_B_PROJECT (JFSJDID)
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DS.IDX_C_B_PRO_04 on DS.C_B_PROJECT (JFXMBH)
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table C_B_TIME
prompt =======================
prompt
create table DS.C_B_TIME
(
  JFBBID  VARCHAR2(30),
  JFSJDID VARCHAR2(30) not null,
  QSSJ    VARCHAR2(6),
  ZZSJ    VARCHAR2(6),
  BZ      VARCHAR2(100)
)
tablespace TS_DS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DS.C_B_TIME
  is '公司计费时间段(不是很合适，想表达的意思是：多种算法并存。满足一定条件的采用不同的计费方法)';
comment on column DS.C_B_TIME.JFBBID
  is '计费版本ID';
comment on column DS.C_B_TIME.JFSJDID
  is '计费时间段ID';
comment on column DS.C_B_TIME.QSSJ
  is '(包含)起始时间，07:00';
comment on column DS.C_B_TIME.ZZSJ
  is '(不包含)终止时间，18:00';
comment on column DS.C_B_TIME.BZ
  is '备注';
alter table DS.C_B_TIME
  add constraint PK_C_B_TIME primary key (JFSJDID)
  using index 
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DS.IDX_C_B_T_01 on DS.C_B_TIME (JFBBID)
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table C_B_VERSION
prompt ==========================
prompt
create table DS.C_B_VERSION
(
  JFBBID VARCHAR2(30) not null,
  GSID   VARCHAR2(30),
  DJLX   VARCHAR2(3),
  JFBBBH VARCHAR2(10),
  JFMS   VARCHAR2(2000),
  CJSJ   DATE,
  BZ     VARCHAR2(500),
  QTJFMS VARCHAR2(1000)
)
tablespace TS_DS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DS.C_B_VERSION
  is '公司计费版本管理';
comment on column DS.C_B_VERSION.JFBBID
  is '计费版本ID';
comment on column DS.C_B_VERSION.GSID
  is '公司ID';
comment on column DS.C_B_VERSION.DJLX
  is '代驾类型';
comment on column DS.C_B_VERSION.JFBBBH
  is '计费版本编号';
comment on column DS.C_B_VERSION.JFMS
  is '计费描述';
comment on column DS.C_B_VERSION.CJSJ
  is '创建时间';
comment on column DS.C_B_VERSION.BZ
  is '备注';
comment on column DS.C_B_VERSION.QTJFMS
  is '本计费软件不包含的费用说明';
alter table DS.C_B_VERSION
  add constraint PK_C_B_VER primary key (JFBBID)
  using index 
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DS.IDX_C_B_BER_01 on DS.C_B_VERSION (GSID)
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table C_INFO
prompt =====================
prompt
create table DS.C_INFO
(
  GSID   VARCHAR2(30) not null,
  GSBH   VARCHAR2(20),
  GSMC   VARCHAR2(100),
  GSFR   VARCHAR2(50),
  GSLXR  VARCHAR2(50),
  GSLXDH VARCHAR2(20),
  BZ     VARCHAR2(500)
)
tablespace TS_DS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DS.C_INFO
  is '公司基本信息';
comment on column DS.C_INFO.GSID
  is '公司ID';
comment on column DS.C_INFO.GSBH
  is '公司编号';
comment on column DS.C_INFO.GSMC
  is '公司名称';
comment on column DS.C_INFO.GSFR
  is '公司法人';
comment on column DS.C_INFO.GSLXR
  is '公司联系人';
comment on column DS.C_INFO.GSLXDH
  is '公司联系电话';
comment on column DS.C_INFO.BZ
  is '备注';
alter table DS.C_INFO
  add constraint PK_C_INFO primary key (GSID)
  using index 
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DS.IDX_C_INFO_01 on DS.C_INFO (GSBH)
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table C_REGIST
prompt =======================
prompt
create table DS.C_REGIST
(
  ZCID   VARCHAR2(30) not null,
  GSID   VARCHAR2(30),
  DJLX   VARCHAR2(3),
  ZCZT   VARCHAR2(3),
  JFBBID VARCHAR2(30),
  YXQ    DATE,
  BZ     VARCHAR2(500),
  YYLXR  VARCHAR2(50),
  YYLXDH VARCHAR2(20)
)
tablespace TS_DS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DS.C_REGIST
  is '公司注册';
comment on column DS.C_REGIST.ZCID
  is '注册ID';
comment on column DS.C_REGIST.GSID
  is '公司ID';
comment on column DS.C_REGIST.DJLX
  is '代驾类型';
comment on column DS.C_REGIST.ZCZT
  is '注册状态（有效、暂停、注销）';
comment on column DS.C_REGIST.JFBBID
  is '计费版本ID';
comment on column DS.C_REGIST.YXQ
  is '注册有效期';
comment on column DS.C_REGIST.BZ
  is '备注';
comment on column DS.C_REGIST.YYLXR
  is '预约联系人';
comment on column DS.C_REGIST.YYLXDH
  is '预约联系电话（一键拨打的号码）';
alter table DS.C_REGIST
  add constraint PK_C_REGIST primary key (ZCID)
  using index 
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DS.IDX_C_REGIST_01 on DS.C_REGIST (GSID)
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DS.IDX_C_REGIST_02 on DS.C_REGIST (JFBBID)
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SEARCH_BATCH
prompt ===========================
prompt
create table DS.SEARCH_BATCH
(
  SSPCID VARCHAR2(30) not null,
  USERID VARCHAR2(30),
  SSSJ   DATE,
  YYSJ   DATE,
  CFDMC  VARCHAR2(200),
  CFDJD  VARCHAR2(20),
  CFDWD  VARCHAR2(20),
  MDDMC  VARCHAR2(200),
  MDDJD  VARCHAR2(20),
  MDDWD  VARCHAR2(20),
  YGHS   NUMBER,
  YGJL   NUMBER(8,2),
  DDSJ   DATE,
  BZ     VARCHAR2(100)
)
tablespace TS_DS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DS.SEARCH_BATCH
  is '搜索批次';
comment on column DS.SEARCH_BATCH.SSPCID
  is '搜索批次id';
comment on column DS.SEARCH_BATCH.USERID
  is '用户id';
comment on column DS.SEARCH_BATCH.SSSJ
  is '搜索时间';
comment on column DS.SEARCH_BATCH.YYSJ
  is '预约时间';
comment on column DS.SEARCH_BATCH.CFDMC
  is '出发地名称';
comment on column DS.SEARCH_BATCH.CFDJD
  is '出发地经度';
comment on column DS.SEARCH_BATCH.CFDWD
  is '出发地纬度';
comment on column DS.SEARCH_BATCH.MDDMC
  is '目的地名称';
comment on column DS.SEARCH_BATCH.MDDJD
  is '目的地经度';
comment on column DS.SEARCH_BATCH.MDDWD
  is '目的地纬度';
comment on column DS.SEARCH_BATCH.YGHS
  is '预估耗时（分钟）';
comment on column DS.SEARCH_BATCH.YGJL
  is '预估距离（公里）';
comment on column DS.SEARCH_BATCH.DDSJ
  is '到达时间';
comment on column DS.SEARCH_BATCH.BZ
  is '备注';
alter table DS.SEARCH_BATCH
  add constraint PK_SEAR_PATCH primary key (SSPCID)
  using index 
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DS.IDX_SEAR_PATCH_01 on DS.SEARCH_BATCH (USERID)
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SEARCH_RECORD
prompt ============================
prompt
create table DS.SEARCH_RECORD
(
  SSJLID VARCHAR2(30) not null,
  SSPCID VARCHAR2(30),
  SSSJ   DATE,
  YYSJ   DATE,
  MDDMC  VARCHAR2(200),
  MDDJD  VARCHAR2(20),
  MDDWD  VARCHAR2(20),
  YGHS   NUMBER,
  YGJL   NUMBER(8,2),
  DDSJ   DATE,
  BZ     VARCHAR2(100)
)
tablespace TS_DS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DS.SEARCH_RECORD
  is '搜索记录';
comment on column DS.SEARCH_RECORD.SSJLID
  is '搜索记录ID';
comment on column DS.SEARCH_RECORD.SSPCID
  is '搜索批次ID';
comment on column DS.SEARCH_RECORD.SSSJ
  is '搜索时间';
comment on column DS.SEARCH_RECORD.YYSJ
  is '预约时间';
comment on column DS.SEARCH_RECORD.MDDMC
  is '目的地名称';
comment on column DS.SEARCH_RECORD.MDDJD
  is '目的地经度';
comment on column DS.SEARCH_RECORD.MDDWD
  is '目的地纬度';
comment on column DS.SEARCH_RECORD.YGHS
  is '预估耗时（分钟）';
comment on column DS.SEARCH_RECORD.YGJL
  is '预估距离（公里）';
comment on column DS.SEARCH_RECORD.DDSJ
  is '到达时间';
comment on column DS.SEARCH_RECORD.BZ
  is '备注';
alter table DS.SEARCH_RECORD
  add constraint PK_SEAR_RECORD primary key (SSJLID)
  using index 
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DS.IDX_SEAR_RECORD_01 on DS.SEARCH_RECORD (SSPCID)
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SEARCH_RESULT
prompt ============================
prompt
create table DS.SEARCH_RESULT
(
  SSJLID VARCHAR2(30) not null,
  GSID   VARCHAR2(30) not null,
  SSPCID VARCHAR2(30),
  GSJG   NUMBER(8,2),
  SSPM   NUMBER,
  JFBBID VARCHAR2(30),
  BZ     VARCHAR2(100)
)
tablespace TS_DS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DS.SEARCH_RESULT
  is '搜索结果';
comment on column DS.SEARCH_RESULT.SSJLID
  is '搜索记录ID';
comment on column DS.SEARCH_RESULT.GSID
  is '公司ID';
comment on column DS.SEARCH_RESULT.SSPCID
  is '搜索批次ID';
comment on column DS.SEARCH_RESULT.GSJG
  is '估算价格';
comment on column DS.SEARCH_RESULT.SSPM
  is '搜索排名';
comment on column DS.SEARCH_RESULT.JFBBID
  is '计费版本ID';
comment on column DS.SEARCH_RESULT.BZ
  is '备注';
alter table DS.SEARCH_RESULT
  add constraint PK_SEAR_RESULT primary key (SSJLID, GSID)
  using index 
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DS.PK_SEAR_RESULT_01 on DS.SEARCH_RESULT (SSPCID)
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SEARCH_RES_DETAIL
prompt ================================
prompt
create table DS.SEARCH_RES_DETAIL
(
  SSJLID VARCHAR2(30) not null,
  GSID   VARCHAR2(30) not null,
  JFXMID VARCHAR2(30) not null,
  JFBBID VARCHAR2(30) not null,
  XMFY   NUMBER(8,2),
  XMFYMS VARCHAR2(100),
  BZ     VARCHAR2(100)
)
tablespace TS_DS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DS.SEARCH_RES_DETAIL
  is '搜索结果明细';
comment on column DS.SEARCH_RES_DETAIL.SSJLID
  is '搜索记录ID';
comment on column DS.SEARCH_RES_DETAIL.GSID
  is '公司ID';
comment on column DS.SEARCH_RES_DETAIL.JFXMID
  is '计费项目ID';
comment on column DS.SEARCH_RES_DETAIL.JFBBID
  is '计费版本ID';
comment on column DS.SEARCH_RES_DETAIL.XMFY
  is '项目费用';
comment on column DS.SEARCH_RES_DETAIL.XMFYMS
  is '项目费用描述，比如 夜间费用：7 * 5=35 ';
comment on column DS.SEARCH_RES_DETAIL.BZ
  is '备注';
alter table DS.SEARCH_RES_DETAIL
  add constraint PK_SEARCH_DETAIL primary key (SSJLID, GSID, JFXMID, JFBBID)
  using index 
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table S_CODE
prompt =====================
prompt
create table DS.S_CODE
(
  DMID VARCHAR2(30) not null,
  DMLX VARCHAR2(10),
  DMMC VARCHAR2(30),
  DMZ  VARCHAR2(6),
  XSSX VARCHAR2(12)
)
tablespace TS_DS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DS.S_CODE
  is '代码表';
comment on column DS.S_CODE.DMID
  is '代码ID';
comment on column DS.S_CODE.DMLX
  is '代码类型';
comment on column DS.S_CODE.DMMC
  is '代码名称';
comment on column DS.S_CODE.DMZ
  is '代码值';
comment on column DS.S_CODE.XSSX
  is '显示顺序';
alter table DS.S_CODE
  add constraint PK_S_CODE primary key (DMID)
  using index 
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DS.IDX_S_CODE_01 on DS.S_CODE (DMLX, DMZ)
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table S_PARA
prompt =====================
prompt
create table DS.S_PARA
(
  CSID VARCHAR2(30) not null,
  CSBH VARCHAR2(10),
  CSZ  VARCHAR2(10),
  BZ   VARCHAR2(100)
)
tablespace TS_DS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DS.S_PARA
  is '系统参数';
comment on column DS.S_PARA.CSID
  is '参数ID';
comment on column DS.S_PARA.CSBH
  is '参数编号';
comment on column DS.S_PARA.CSZ
  is '参数值';
comment on column DS.S_PARA.BZ
  is '备注';
alter table DS.S_PARA
  add constraint PK_S_PARA primary key (CSID)
  using index 
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DS.IDX_S_PARA on DS.S_PARA (CSBH)
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table U_TEMP_INFO
prompt ==========================
prompt
create table DS.U_TEMP_INFO
(
  USERID VARCHAR2(30) not null,
  YHLY   VARCHAR2(3),
  MOBILE VARCHAR2(20),
  BZ     VARCHAR2(500),
  SJXX   VARCHAR2(500),
  DLSJ   DATE
)
tablespace TS_DS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table DS.U_TEMP_INFO
  is '临时用户';
comment on column DS.U_TEMP_INFO.USERID
  is '用户ID';
comment on column DS.U_TEMP_INFO.YHLY
  is '用户来源：01微信 02Android app 03 。。';
comment on column DS.U_TEMP_INFO.MOBILE
  is '手机号码';
comment on column DS.U_TEMP_INFO.BZ
  is '备注';
comment on column DS.U_TEMP_INFO.SJXX
  is '手机信息';
comment on column DS.U_TEMP_INFO.DLSJ
  is '登陆时间';
alter table DS.U_TEMP_INFO
  add constraint PK_U_TEMP primary key (USERID)
  using index 
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255;
create index DS.IDX_U_TEMP_01 on DS.U_TEMP_INFO (MOBILE)
  tablespace TSI_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table Y_APPOINT
prompt ========================
prompt
create table DS.Y_APPOINT
(
  YYJLID  VARCHAR2(30) not null,
  GSID    VARCHAR2(30),
  USERID  VARCHAR2(30),
  YYLY    VARCHAR2(3),
  YYLYDX  VARCHAR2(30),
  YYLXR   VARCHAR2(50),
  YYLXRDH VARCHAR2(20),
  CZSJ    DATE,
  DJLX    VARCHAR2(3),
  BZ      VARCHAR2(200)
)
tablespace TS_DS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DS.Y_APPOINT
  is '预约';
comment on column DS.Y_APPOINT.YYJLID
  is '预约记录ID';
comment on column DS.Y_APPOINT.GSID
  is '公司ID';
comment on column DS.Y_APPOINT.USERID
  is '用户ID';
comment on column DS.Y_APPOINT.YYLY
  is '预约来源 ，收藏、搜索';
comment on column DS.Y_APPOINT.YYLYDX
  is '预约来源对象，收藏ID，搜索记录ID';
comment on column DS.Y_APPOINT.YYLXR
  is '预约联系人';
comment on column DS.Y_APPOINT.YYLXRDH
  is '预约联系电话';
comment on column DS.Y_APPOINT.CZSJ
  is '系统时间（提供预约服务时间）';
comment on column DS.Y_APPOINT.DJLX
  is '代驾类型';
comment on column DS.Y_APPOINT.BZ
  is '备注';
alter table DS.Y_APPOINT
  add constraint Y_A_YYJLID primary key (YYJLID)
  using index 
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DS.IDX_Y_A_GSID on DS.Y_APPOINT (GSID)
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DS.IDX_Y_A_LYDX on DS.Y_APPOINT (YYLYDX)
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DS.IDX_Y_A_USERID on DS.Y_APPOINT (USERID)
  tablespace TS_DS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating sequence SEQ_DS
prompt ========================
prompt
create sequence DS.SEQ_DS
minvalue 100000
maxvalue 999999
start with 100128
increment by 1
cache 10
cycle;


spool off
