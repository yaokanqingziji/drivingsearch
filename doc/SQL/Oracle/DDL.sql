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
  is '�Ʒ���Ŀ';
comment on column DS.B_PROJECT.JFXMID
  is '�Ʒ���ĿID';
comment on column DS.B_PROJECT.DJLX
  is '�������ͣ�01�ƺ���ݡ�02�������';
comment on column DS.B_PROJECT.XMBH
  is '��Ŀ���';
comment on column DS.B_PROJECT.XMMC
  is '��Ŀ����';
comment on column DS.B_PROJECT.BZ
  is '��ע';
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
  is '��˾�Ʒѱ�׼';
comment on column DS.C_B_PROJECT.JFBBID
  is '�ƷѰ汾ID';
comment on column DS.C_B_PROJECT.JFXMID
  is '�Ʒ���ĿID';
comment on column DS.C_B_PROJECT.JFBZZ
  is '�Ʒѱ�׼ֵ������ÿ30���ӣ�������30';
comment on column DS.C_B_PROJECT.JFED
  is '���ö��(Ԫ)';
comment on column DS.C_B_PROJECT.JFSJDID
  is '�Ʒ�ʱ���ID';
comment on column DS.C_B_PROJECT.JFXMBH
  is '�Ʒ���Ŀ���';
comment on column DS.C_B_PROJECT.JFTJDW
  is '�Ʒ�������λ������ʱ�䣬�����γ��';
comment on column DS.C_B_PROJECT.JFTJXX
  is '�Ʒ���������';
comment on column DS.C_B_PROJECT.JFTJSX
  is '�Ʒ���������';
comment on column DS.C_B_PROJECT.JFBZDW
  is '�Ʒѱ�׼��λ�����磺���ӡ�����';
comment on column DS.C_B_PROJECT.JFBZJSFF
  is '�Ʒѱ�׼�������������磺��ȡ������ȡ������������';
comment on column DS.C_B_PROJECT.BZ
  is '��ע';
comment on column DS.C_B_PROJECT.SFBHXX
  is '�Ƿ�����Ʒ���������ֵ��1���� 0������';
comment on column DS.C_B_PROJECT.SFBHSX
  is '�Ƿ�����Ʒ���������ֵ��1���� 0������';
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
  is '��˾�Ʒ�ʱ���(���Ǻܺ��ʣ��������˼�ǣ������㷨���档����һ�������Ĳ��ò�ͬ�ļƷѷ���)';
comment on column DS.C_B_TIME.JFBBID
  is '�ƷѰ汾ID';
comment on column DS.C_B_TIME.JFSJDID
  is '�Ʒ�ʱ���ID';
comment on column DS.C_B_TIME.QSSJ
  is '(����)��ʼʱ�䣬07:00';
comment on column DS.C_B_TIME.ZZSJ
  is '(������)��ֹʱ�䣬18:00';
comment on column DS.C_B_TIME.BZ
  is '��ע';
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
  is '��˾�ƷѰ汾����';
comment on column DS.C_B_VERSION.JFBBID
  is '�ƷѰ汾ID';
comment on column DS.C_B_VERSION.GSID
  is '��˾ID';
comment on column DS.C_B_VERSION.DJLX
  is '��������';
comment on column DS.C_B_VERSION.JFBBBH
  is '�ƷѰ汾���';
comment on column DS.C_B_VERSION.JFMS
  is '�Ʒ�����';
comment on column DS.C_B_VERSION.CJSJ
  is '����ʱ��';
comment on column DS.C_B_VERSION.BZ
  is '��ע';
comment on column DS.C_B_VERSION.QTJFMS
  is '���Ʒ�����������ķ���˵��';
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
  is '��˾������Ϣ';
comment on column DS.C_INFO.GSID
  is '��˾ID';
comment on column DS.C_INFO.GSBH
  is '��˾���';
comment on column DS.C_INFO.GSMC
  is '��˾����';
comment on column DS.C_INFO.GSFR
  is '��˾����';
comment on column DS.C_INFO.GSLXR
  is '��˾��ϵ��';
comment on column DS.C_INFO.GSLXDH
  is '��˾��ϵ�绰';
comment on column DS.C_INFO.BZ
  is '��ע';
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
  is '��˾ע��';
comment on column DS.C_REGIST.ZCID
  is 'ע��ID';
comment on column DS.C_REGIST.GSID
  is '��˾ID';
comment on column DS.C_REGIST.DJLX
  is '��������';
comment on column DS.C_REGIST.ZCZT
  is 'ע��״̬����Ч����ͣ��ע����';
comment on column DS.C_REGIST.JFBBID
  is '�ƷѰ汾ID';
comment on column DS.C_REGIST.YXQ
  is 'ע����Ч��';
comment on column DS.C_REGIST.BZ
  is '��ע';
comment on column DS.C_REGIST.YYLXR
  is 'ԤԼ��ϵ��';
comment on column DS.C_REGIST.YYLXDH
  is 'ԤԼ��ϵ�绰��һ������ĺ��룩';
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
  is '��������';
comment on column DS.SEARCH_BATCH.SSPCID
  is '��������id';
comment on column DS.SEARCH_BATCH.USERID
  is '�û�id';
comment on column DS.SEARCH_BATCH.SSSJ
  is '����ʱ��';
comment on column DS.SEARCH_BATCH.YYSJ
  is 'ԤԼʱ��';
comment on column DS.SEARCH_BATCH.CFDMC
  is '����������';
comment on column DS.SEARCH_BATCH.CFDJD
  is '�����ؾ���';
comment on column DS.SEARCH_BATCH.CFDWD
  is '������γ��';
comment on column DS.SEARCH_BATCH.MDDMC
  is 'Ŀ�ĵ�����';
comment on column DS.SEARCH_BATCH.MDDJD
  is 'Ŀ�ĵؾ���';
comment on column DS.SEARCH_BATCH.MDDWD
  is 'Ŀ�ĵ�γ��';
comment on column DS.SEARCH_BATCH.YGHS
  is 'Ԥ����ʱ�����ӣ�';
comment on column DS.SEARCH_BATCH.YGJL
  is 'Ԥ�����루���';
comment on column DS.SEARCH_BATCH.DDSJ
  is '����ʱ��';
comment on column DS.SEARCH_BATCH.BZ
  is '��ע';
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
  is '������¼';
comment on column DS.SEARCH_RECORD.SSJLID
  is '������¼ID';
comment on column DS.SEARCH_RECORD.SSPCID
  is '��������ID';
comment on column DS.SEARCH_RECORD.SSSJ
  is '����ʱ��';
comment on column DS.SEARCH_RECORD.YYSJ
  is 'ԤԼʱ��';
comment on column DS.SEARCH_RECORD.MDDMC
  is 'Ŀ�ĵ�����';
comment on column DS.SEARCH_RECORD.MDDJD
  is 'Ŀ�ĵؾ���';
comment on column DS.SEARCH_RECORD.MDDWD
  is 'Ŀ�ĵ�γ��';
comment on column DS.SEARCH_RECORD.YGHS
  is 'Ԥ����ʱ�����ӣ�';
comment on column DS.SEARCH_RECORD.YGJL
  is 'Ԥ�����루���';
comment on column DS.SEARCH_RECORD.DDSJ
  is '����ʱ��';
comment on column DS.SEARCH_RECORD.BZ
  is '��ע';
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
  is '�������';
comment on column DS.SEARCH_RESULT.SSJLID
  is '������¼ID';
comment on column DS.SEARCH_RESULT.GSID
  is '��˾ID';
comment on column DS.SEARCH_RESULT.SSPCID
  is '��������ID';
comment on column DS.SEARCH_RESULT.GSJG
  is '����۸�';
comment on column DS.SEARCH_RESULT.SSPM
  is '��������';
comment on column DS.SEARCH_RESULT.JFBBID
  is '�ƷѰ汾ID';
comment on column DS.SEARCH_RESULT.BZ
  is '��ע';
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
  is '���������ϸ';
comment on column DS.SEARCH_RES_DETAIL.SSJLID
  is '������¼ID';
comment on column DS.SEARCH_RES_DETAIL.GSID
  is '��˾ID';
comment on column DS.SEARCH_RES_DETAIL.JFXMID
  is '�Ʒ���ĿID';
comment on column DS.SEARCH_RES_DETAIL.JFBBID
  is '�ƷѰ汾ID';
comment on column DS.SEARCH_RES_DETAIL.XMFY
  is '��Ŀ����';
comment on column DS.SEARCH_RES_DETAIL.XMFYMS
  is '��Ŀ�������������� ҹ����ã�7 * 5=35 ';
comment on column DS.SEARCH_RES_DETAIL.BZ
  is '��ע';
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
  is '�����';
comment on column DS.S_CODE.DMID
  is '����ID';
comment on column DS.S_CODE.DMLX
  is '��������';
comment on column DS.S_CODE.DMMC
  is '��������';
comment on column DS.S_CODE.DMZ
  is '����ֵ';
comment on column DS.S_CODE.XSSX
  is '��ʾ˳��';
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
  is 'ϵͳ����';
comment on column DS.S_PARA.CSID
  is '����ID';
comment on column DS.S_PARA.CSBH
  is '�������';
comment on column DS.S_PARA.CSZ
  is '����ֵ';
comment on column DS.S_PARA.BZ
  is '��ע';
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
  is '��ʱ�û�';
comment on column DS.U_TEMP_INFO.USERID
  is '�û�ID';
comment on column DS.U_TEMP_INFO.YHLY
  is '�û���Դ��01΢�� 02Android app 03 ����';
comment on column DS.U_TEMP_INFO.MOBILE
  is '�ֻ�����';
comment on column DS.U_TEMP_INFO.BZ
  is '��ע';
comment on column DS.U_TEMP_INFO.SJXX
  is '�ֻ���Ϣ';
comment on column DS.U_TEMP_INFO.DLSJ
  is '��½ʱ��';
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
  is 'ԤԼ';
comment on column DS.Y_APPOINT.YYJLID
  is 'ԤԼ��¼ID';
comment on column DS.Y_APPOINT.GSID
  is '��˾ID';
comment on column DS.Y_APPOINT.USERID
  is '�û�ID';
comment on column DS.Y_APPOINT.YYLY
  is 'ԤԼ��Դ ���ղء�����';
comment on column DS.Y_APPOINT.YYLYDX
  is 'ԤԼ��Դ�����ղ�ID��������¼ID';
comment on column DS.Y_APPOINT.YYLXR
  is 'ԤԼ��ϵ��';
comment on column DS.Y_APPOINT.YYLXRDH
  is 'ԤԼ��ϵ�绰';
comment on column DS.Y_APPOINT.CZSJ
  is 'ϵͳʱ�䣨�ṩԤԼ����ʱ�䣩';
comment on column DS.Y_APPOINT.DJLX
  is '��������';
comment on column DS.Y_APPOINT.BZ
  is '��ע';
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
