
CREATE TABLE `B_PROJECT` (
`JFXMID`  varchar(30) NOT NULL ,
`DJLX`  varchar(3) NULL ,
`XMBH`  varchar(10) NULL ,
`XMMC`  varchar(50) NULL ,
`BZ`  varchar(500) NULL ,
PRIMARY KEY (`JFXMID`),
INDEX `IDX_B_PROJECT_01` (`XMBH`)
)
DEFAULT CHARACTER SET=utf8
;

CREATE TABLE `C_B_PROJECT` (
`JFBBID`  varchar(30) NULL ,
`JFXMID`  varchar(30) NULL ,
`JFBZZ`  varchar(30) NULL ,
`JFED`  double(12,2) NULL ,
`JFSJDID`  varchar(30) NULL ,
`JFXMBH`  varchar(10) NULL ,
`JFTJDW`  varchar(3) NULL ,
`JFTJXX`  varchar(50) NULL ,
`JFTJSX`  varchar(50) NULL ,
`JFBZDW`  varchar(3) NULL ,
`JFBZJSFF`  varchar(3) NULL ,
`BZ`  varchar(500) NULL ,
`SFBHXX`  varchar(3) NULL ,
`SFBHSX`  varchar(3) NULL ,
INDEX `IDX_C_B_PRO_01` (`JFBBID`),
INDEX `IDX_C_B_PRO_02` (`JFXMID`),
INDEX `IDX_C_B_PRO_03` (`JFSJDID`),
INDEX `IDX_C_B_PRO_04` (`JFXMBH`)
)
DEFAULT CHARACTER SET=utf8
;


CREATE TABLE `C_B_TIME` (
`JFBBID`  varchar(30) NULL ,
`JFSJDID`  varchar(30) NOT NULL ,
`QSSJ`  varchar(6) NULL ,
`ZZSJ`  varchar(6) NULL ,
`BZ`  varchar(100) NULL ,
PRIMARY KEY (`JFSJDID`),
INDEX `IDX_C_B_T_01` (`JFBBID`)
)
DEFAULT CHARACTER SET=utf8
;

CREATE TABLE `C_B_VERSION` (
`JFBBID`  varchar(30) NOT NULL ,
`GSID`  varchar(30) NULL ,
`DJLX`  varchar(3) NULL ,
`JFBBBH`  varchar(10) NULL ,
`JFMS`  varchar(2000) NULL ,
`CJSJ`  datetime NULL ,
`BZ`  varchar(500) NULL ,
`QTJFMS`  varchar(1000) NULL ,
PRIMARY KEY (`JFBBID`),
INDEX `IDX_C_B_BER_01` (`GSID`)
)
DEFAULT CHARACTER SET=utf8
;

CREATE TABLE `C_INFO` (
`GSID`  varchar(30) NOT NULL ,
`GSBH`  varchar(20) NULL ,
`GSMC`  varchar(100) NULL ,
`GSFR`  varchar(50) NULL ,
`GSLXR`  varchar(50) NULL ,
`GSLXDH`  varchar(20) NULL ,
`BZ`  varchar(500) NULL ,
PRIMARY KEY (`GSID`),
INDEX `IDX_C_INFO_01` (`GSBH`)
)
DEFAULT CHARACTER SET=utf8
;

CREATE TABLE `C_REGIST` (
`ZCID`  varchar(30) NOT NULL ,
`GSID`  varchar(30) NULL ,
`DJLX`  varchar(3) NULL ,
`ZCZT`  varchar(3) NULL ,
`JFBBID`  varchar(30) NULL ,
`YXQ`  datetime NULL ,
`BZ`  varchar(500) NULL ,
`YYLXR`  varchar(50) NULL ,
`YYLXDH`  varchar(20) NULL ,
PRIMARY KEY (`ZCID`),
INDEX `IDX_C_REGIST_01` (`GSID`),
INDEX `IDX_C_REGIST_02` (`JFBBID`)
)
;
CREATE TABLE `SEARCH_BATCH` (
`SSPCID`  varchar(30) NOT NULL ,
`USERID`  varchar(30) NULL ,
`SSSJ`  datetime NULL ,
`YYSJ`  datetime NULL ,
`CFDMC`  varchar(200) NULL ,
`CFDJD`  varchar(20) NULL ,
`CFDWD`  varchar(20) NULL ,
`MDDMC`  varchar(200) NULL ,
`MDDJD`  varchar(20) NULL ,
`MDDWD`  varchar(20) NULL ,
`YGHS`  int NULL ,
`YGJL`  double(8,2) NULL ,
`DDSJ`  datetime NULL ,
`BZ`  varchar(100) NULL ,
PRIMARY KEY (`SSPCID`),
INDEX `IDX_SEAR_PATCH_01` (`USERID`)
)
DEFAULT CHARACTER SET=utf8
;


CREATE TABLE `SEARCH_RECORD` (
`SSJLID`  varchar(30) NOT NULL ,
`SSPCID`  varchar(30) NULL ,
`SSSJ`  datetime NULL ,
`YYSJ`  datetime NULL ,
`MDDMC`  varchar(200) NULL ,
`MDDJD`  varchar(20) NULL ,
`MDDWD`  varchar(20) NULL ,
`YGHS`  int NULL ,
`YGJL`  double(8,2) NULL ,
`DDSJ`  datetime NULL ,
`BZ`  varchar(100) NULL ,
PRIMARY KEY (`SSJLID`),
INDEX `IDX_SEAR_RECORD_01` (`SSPCID`)
)
DEFAULT CHARACTER SET=utf8
;
CREATE TABLE `SEARCH_RESULT` (
`SSJLID`  varchar(30) NOT NULL ,
`GSID`  varchar(30) NOT NULL ,
`SSPCID`  varchar(30) NULL ,
`GSJG`  double(8,2) NULL ,
`SSPM`  int NULL ,
`JFBBID`  varchar(30) NULL ,
`BZ`  varchar(100) NULL ,
PRIMARY KEY (`SSJLID`, `GSID`),
INDEX `PK_SEAR_RESULT_01` (`SSPCID`)
)
DEFAULT CHARACTER SET=utf8
;

CREATE TABLE `SEARCH_RES_DETAIL` (
`SSJLID`  varchar(30) NOT NULL ,
`GSID`  varchar(30) NOT NULL ,
`JFXMID`  varchar(30) NOT NULL ,
`JFBBID`  varchar(30) NOT NULL ,
`XMFY`  double(8,2) NULL ,
`XMFYMS`  varchar(100) NULL ,
`BZ`  varchar(100) NULL ,
PRIMARY KEY (`SSJLID`, `GSID`, `JFXMID`, `JFBBID`)
)
DEFAULT CHARACTER SET=utf8
;


CREATE TABLE `S_CODE` (
`DMID`  varchar(30) NOT NULL ,
`DMLX`  varchar(10) NULL ,
`DMMC`  varchar(30) NULL ,
`DMZ`  varchar(6) NULL ,
`XSSX`  varchar(12) NULL ,
PRIMARY KEY (`DMID`),
INDEX `IDX_S_CODE_01` (`DMLX`, `DMZ`)
)
DEFAULT CHARACTER SET=utf8
;

CREATE TABLE `S_PARA` (
`CSID`  varchar(30) NOT NULL ,
`CSBH`  varchar(10) NULL ,
`CSZ`  varchar(10) NULL ,
`BZ`  varchar(100) NULL ,
PRIMARY KEY (`CSID`),
INDEX `IDX_S_PARA` (`CSBH`)
)
DEFAULT CHARACTER SET=utf8
;
CREATE TABLE `U_TEMP_INFO` (
`USERID`  varchar(30) NOT NULL ,
`YHLY`  varchar(3) NULL ,
`MOBILE`  varchar(20) NULL ,
`BZ`  varchar(500) NULL ,
`SJXX`  varchar(500) NULL ,
`DLSJ`  datetime NULL ,
PRIMARY KEY (`USERID`),
INDEX `IDX_U_TEMP_01` (`MOBILE`)
)
DEFAULT CHARACTER SET=utf8
;



CREATE TABLE `Y_APPOINT` (
`YYJLID`  varchar(30) NOT NULL ,
`GSID`  varchar(30) NULL ,
`USERID`  varchar(30) NULL ,
`YYLY`  varchar(3) NULL ,
`YYLYDX`  varchar(30) NULL ,
`YYLXR`  varchar(50) NULL ,
`YYLXRDH`  varchar(20) NULL ,
`CZSJ`  datetime NULL ,
`DJLX`  varchar(3) NULL ,
`BZ`  varchar(200) NULL ,
PRIMARY KEY (`YYJLID`),
INDEX `IDX_Y_A_GSID` (`GSID`),
INDEX `IDX_Y_A_LYDX` (`YYLYDX`),
INDEX `IDX_Y_A_USERID` (`USERID`)
)
DEFAULT CHARACTER SET=utf8
;

