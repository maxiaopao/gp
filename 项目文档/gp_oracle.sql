prompt PL/SQL Developer import file
prompt Created on 2017年12月23日 by Mr
set feedback off
set define off
prompt Dropping GEN_SCHEME...
drop table GEN_SCHEME cascade constraints;
prompt Dropping GEN_TABLE...
drop table GEN_TABLE cascade constraints;
prompt Dropping GEN_TABLE_COLUMN...
drop table GEN_TABLE_COLUMN cascade constraints;
prompt Dropping SYS_AREA...
drop table SYS_AREA cascade constraints;
prompt Dropping SYS_DICT...
drop table SYS_DICT cascade constraints;
prompt Dropping SYS_MDICT...
drop table SYS_MDICT cascade constraints;
prompt Dropping SYS_MENU...
drop table SYS_MENU cascade constraints;
prompt Dropping SYS_OFFICE...
drop table SYS_OFFICE cascade constraints;
prompt Dropping SYS_ROLE...
drop table SYS_ROLE cascade constraints;
prompt Dropping SYS_ROLE_MENU...
drop table SYS_ROLE_MENU cascade constraints;
prompt Dropping SYS_ROLE_OFFICE...
drop table SYS_ROLE_OFFICE cascade constraints;
prompt Dropping SYS_USER...
drop table SYS_USER cascade constraints;
prompt Dropping SYS_USER_ROLE...
drop table SYS_USER_ROLE cascade constraints;
prompt Dropping TEST_DATA...
drop table TEST_DATA cascade constraints;
prompt Dropping TEST_DATA_CHILD...
drop table TEST_DATA_CHILD cascade constraints;
prompt Dropping TEST_DATA_MAIN...
drop table TEST_DATA_MAIN cascade constraints;
prompt Dropping TEST_TREE...
drop table TEST_TREE cascade constraints;

prompt Dropping GEN_TEMPLATE...
drop table GEN_TEMPLATE cascade constraints;
prompt Dropping SYS_LOG...
drop table SYS_LOG cascade constraints;

prompt Creating GEN_SCHEME...
create table GEN_SCHEME
(
  ID                   VARCHAR2(64) not null,
  NAME                 NVARCHAR2(200),
  CATEGORY             VARCHAR2(2000),
  PACKAGE_NAME         VARCHAR2(500),
  MODULE_NAME          VARCHAR2(30),
  SUB_MODULE_NAME      VARCHAR2(30),
  FUNCTION_NAME        NVARCHAR2(500),
  FUNCTION_NAME_SIMPLE NVARCHAR2(100),
  FUNCTION_AUTHOR      NVARCHAR2(100),
  GEN_TABLE_ID         VARCHAR2(200),
  CREATE_BY            VARCHAR2(64),
  CREATE_DATE          TIMESTAMP(6),
  UPDATE_BY            VARCHAR2(64),
  UPDATE_DATE          TIMESTAMP(6),
  REMARKS              NVARCHAR2(255),
  DEL_FLAG             CHAR(1) default '0' not null
)
tablespace USERS
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
comment on table GEN_SCHEME
  is '生成方案';
comment on column GEN_SCHEME.ID
  is '编号';
comment on column GEN_SCHEME.NAME
  is '名称';
comment on column GEN_SCHEME.CATEGORY
  is '分类';
comment on column GEN_SCHEME.PACKAGE_NAME
  is '生成包路径';
comment on column GEN_SCHEME.MODULE_NAME
  is '生成模块名';
comment on column GEN_SCHEME.SUB_MODULE_NAME
  is '生成子模块名';
comment on column GEN_SCHEME.FUNCTION_NAME
  is '生成功能名';
comment on column GEN_SCHEME.FUNCTION_NAME_SIMPLE
  is '生成功能名（简写）';
comment on column GEN_SCHEME.FUNCTION_AUTHOR
  is '生成功能作者';
comment on column GEN_SCHEME.GEN_TABLE_ID
  is '生成表编号';
comment on column GEN_SCHEME.CREATE_BY
  is '创建者';
comment on column GEN_SCHEME.CREATE_DATE
  is '创建时间';
comment on column GEN_SCHEME.UPDATE_BY
  is '更新者';
comment on column GEN_SCHEME.UPDATE_DATE
  is '更新时间';
comment on column GEN_SCHEME.REMARKS
  is '备注信息';
comment on column GEN_SCHEME.DEL_FLAG
  is '删除标记（0：正常；1：删除）';
alter table GEN_SCHEME
  add primary key (ID)
  using index 
  tablespace USERS
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
create index GEN_SCHEME_DEL_FLAG on GEN_SCHEME (DEL_FLAG)
  tablespace USERS
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

prompt Creating GEN_TABLE...
create table GEN_TABLE
(
  ID              VARCHAR2(64) not null,
  NAME            NVARCHAR2(200),
  COMMENTS        NVARCHAR2(500),
  CLASS_NAME      VARCHAR2(100),
  PARENT_TABLE    VARCHAR2(200),
  PARENT_TABLE_FK VARCHAR2(100),
  CREATE_BY       VARCHAR2(64),
  CREATE_DATE     TIMESTAMP(6),
  UPDATE_BY       VARCHAR2(64),
  UPDATE_DATE     TIMESTAMP(6),
  REMARKS         NVARCHAR2(255),
  DEL_FLAG        CHAR(1) default '0' not null
)
tablespace USERS
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
comment on table GEN_TABLE
  is '业务表';
comment on column GEN_TABLE.ID
  is '编号';
comment on column GEN_TABLE.NAME
  is '名称';
comment on column GEN_TABLE.COMMENTS
  is '描述';
comment on column GEN_TABLE.CLASS_NAME
  is '实体类名称';
comment on column GEN_TABLE.PARENT_TABLE
  is '关联父表';
comment on column GEN_TABLE.PARENT_TABLE_FK
  is '关联父表外键';
comment on column GEN_TABLE.CREATE_BY
  is '创建者';
comment on column GEN_TABLE.CREATE_DATE
  is '创建时间';
comment on column GEN_TABLE.UPDATE_BY
  is '更新者';
comment on column GEN_TABLE.UPDATE_DATE
  is '更新时间';
comment on column GEN_TABLE.REMARKS
  is '备注信息';
comment on column GEN_TABLE.DEL_FLAG
  is '删除标记（0：正常；1：删除）';
alter table GEN_TABLE
  add primary key (ID)
  using index 
  tablespace USERS
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
create index GEN_TABLE_DEL_FLAG on GEN_TABLE (DEL_FLAG)
  tablespace USERS
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
create index GEN_TABLE_NAME on GEN_TABLE (NAME)
  tablespace USERS
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

prompt Creating GEN_TABLE_COLUMN...
create table GEN_TABLE_COLUMN
(
  ID           VARCHAR2(64) not null,
  GEN_TABLE_ID VARCHAR2(64),
  NAME         NVARCHAR2(200),
  COMMENTS     NVARCHAR2(500),
  JDBC_TYPE    VARCHAR2(100),
  JAVA_TYPE    VARCHAR2(500),
  JAVA_FIELD   VARCHAR2(200),
  IS_PK        CHAR(1),
  IS_NULL      CHAR(1),
  IS_INSERT    CHAR(1),
  IS_EDIT      CHAR(1),
  IS_LIST      CHAR(1),
  IS_QUERY     CHAR(1),
  QUERY_TYPE   VARCHAR2(200),
  SHOW_TYPE    VARCHAR2(200),
  DICT_TYPE    VARCHAR2(200),
  SETTINGS     NVARCHAR2(2000),
  SORT         NUMBER,
  CREATE_BY    VARCHAR2(64),
  CREATE_DATE  TIMESTAMP(6),
  UPDATE_BY    VARCHAR2(64),
  UPDATE_DATE  TIMESTAMP(6),
  REMARKS      NVARCHAR2(255),
  DEL_FLAG     CHAR(1) default '0' not null
)
tablespace USERS
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
comment on table GEN_TABLE_COLUMN
  is '业务表字段';
comment on column GEN_TABLE_COLUMN.ID
  is '编号';
comment on column GEN_TABLE_COLUMN.GEN_TABLE_ID
  is '归属表编号';
comment on column GEN_TABLE_COLUMN.NAME
  is '名称';
comment on column GEN_TABLE_COLUMN.COMMENTS
  is '描述';
comment on column GEN_TABLE_COLUMN.JDBC_TYPE
  is '列的数据类型的字节长度';
comment on column GEN_TABLE_COLUMN.JAVA_TYPE
  is 'JAVA类型';
comment on column GEN_TABLE_COLUMN.JAVA_FIELD
  is 'JAVA字段名';
comment on column GEN_TABLE_COLUMN.IS_PK
  is '是否主键';
comment on column GEN_TABLE_COLUMN.IS_NULL
  is '是否可为空';
comment on column GEN_TABLE_COLUMN.IS_INSERT
  is '是否为插入字段';
comment on column GEN_TABLE_COLUMN.IS_EDIT
  is '是否编辑字段';
comment on column GEN_TABLE_COLUMN.IS_LIST
  is '是否列表字段';
comment on column GEN_TABLE_COLUMN.IS_QUERY
  is '是否查询字段';
comment on column GEN_TABLE_COLUMN.QUERY_TYPE
  is '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）';
comment on column GEN_TABLE_COLUMN.SHOW_TYPE
  is '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）';
comment on column GEN_TABLE_COLUMN.DICT_TYPE
  is '字典类型';
comment on column GEN_TABLE_COLUMN.SETTINGS
  is '其它设置（扩展字段JSON）';
comment on column GEN_TABLE_COLUMN.SORT
  is '排序（升序）';
comment on column GEN_TABLE_COLUMN.CREATE_BY
  is '创建者';
comment on column GEN_TABLE_COLUMN.CREATE_DATE
  is '创建时间';
comment on column GEN_TABLE_COLUMN.UPDATE_BY
  is '更新者';
comment on column GEN_TABLE_COLUMN.UPDATE_DATE
  is '更新时间';
comment on column GEN_TABLE_COLUMN.REMARKS
  is '备注信息';
comment on column GEN_TABLE_COLUMN.DEL_FLAG
  is '删除标记（0：正常；1：删除）';
alter table GEN_TABLE_COLUMN
  add primary key (ID)
  using index 
  tablespace USERS
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
create index GEN_TABLE_COLUMN_DEL_FLAG on GEN_TABLE_COLUMN (DEL_FLAG)
  tablespace USERS
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
create index GEN_TABLE_COLUMN_NAME on GEN_TABLE_COLUMN (NAME)
  tablespace USERS
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
create index GEN_TABLE_COLUMN_SORT on GEN_TABLE_COLUMN (SORT)
  tablespace USERS
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
create index GEN_TABLE_COLUMN_TABLE_ID on GEN_TABLE_COLUMN (GEN_TABLE_ID)
  tablespace USERS
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

prompt Creating SYS_AREA...
create table SYS_AREA
(
  ID          VARCHAR2(64) not null,
  PARENT_ID   VARCHAR2(64) not null,
  PARENT_IDS  VARCHAR2(2000) not null,
  NAME        NVARCHAR2(100) not null,
  SORT        NUMBER(10) not null,
  CODE        VARCHAR2(100),
  TYPE        CHAR(1),
  CREATE_BY   VARCHAR2(64) not null,
  CREATE_DATE TIMESTAMP(6) not null,
  UPDATE_BY   VARCHAR2(64) not null,
  UPDATE_DATE TIMESTAMP(6) not null,
  REMARKS     NVARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null
)
tablespace USERS
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
alter table SYS_AREA
  add primary key (ID)
  using index 
  tablespace USERS
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
create index SYS_AREA_DEL_FLAG on SYS_AREA (DEL_FLAG)
  tablespace USERS
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
create index SYS_AREA_PARENT_ID on SYS_AREA (PARENT_ID)
  tablespace USERS
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
create index SYS_AREA_PARENT_IDS on SYS_AREA (PARENT_IDS)
  tablespace USERS
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

prompt Creating SYS_DICT...
create table SYS_DICT
(
  ID          VARCHAR2(64) not null,
  VALUE       VARCHAR2(100) not null,
  LABEL       VARCHAR2(100) not null,
  TYPE        VARCHAR2(100) not null,
  DESCRIPTION NVARCHAR2(100) not null,
  SORT        NUMBER(10) not null,
  PARENT_ID   VARCHAR2(64) default '0',
  CREATE_BY   VARCHAR2(64) not null,
  CREATE_DATE TIMESTAMP(6) not null,
  UPDATE_BY   VARCHAR2(64) not null,
  UPDATE_DATE TIMESTAMP(6) not null,
  REMARKS     NVARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null
)
tablespace USERS
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
alter table SYS_DICT
  add primary key (ID)
  using index 
  tablespace USERS
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
create index SYS_DICT_DEL_FLAG on SYS_DICT (DEL_FLAG)
  tablespace USERS
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
create index SYS_DICT_LABEL on SYS_DICT (LABEL)
  tablespace USERS
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
create index SYS_DICT_VALUE on SYS_DICT (VALUE)
  tablespace USERS
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

prompt Creating SYS_MDICT...
create table SYS_MDICT
(
  ID          VARCHAR2(64) not null,
  PARENT_ID   VARCHAR2(64) not null,
  PARENT_IDS  VARCHAR2(2000) not null,
  NAME        NVARCHAR2(100) not null,
  SORT        NUMBER(10) not null,
  DESCRIPTION NVARCHAR2(100),
  CREATE_BY   VARCHAR2(64) not null,
  CREATE_DATE TIMESTAMP(6) not null,
  UPDATE_BY   VARCHAR2(64) not null,
  UPDATE_DATE TIMESTAMP(6) not null,
  REMARKS     NVARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table SYS_MDICT
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index SYS_MDICT_DEL_FLAG on SYS_MDICT (DEL_FLAG)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index SYS_MDICT_PARENT_ID on SYS_MDICT (PARENT_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index SYS_MDICT_PARENT_IDS on SYS_MDICT (PARENT_IDS)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating SYS_MENU...
create table SYS_MENU
(
  ID          VARCHAR2(64) not null,
  PARENT_ID   VARCHAR2(64) not null,
  PARENT_IDS  VARCHAR2(2000) not null,
  NAME        NVARCHAR2(100) not null,
  SORT        NUMBER(10) not null,
  HREF        VARCHAR2(2000),
  TARGET      VARCHAR2(20),
  ICON        VARCHAR2(100),
  IS_SHOW     CHAR(1) not null,
  PERMISSION  VARCHAR2(200),
  CREATE_BY   VARCHAR2(64) not null,
  CREATE_DATE TIMESTAMP(6) not null,
  UPDATE_BY   VARCHAR2(64) not null,
  UPDATE_DATE TIMESTAMP(6) not null,
  REMARKS     NVARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null
)
tablespace USERS
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
alter table SYS_MENU
  add primary key (ID)
  using index 
  tablespace USERS
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
create index SYS_MENU_DEL_FLAG on SYS_MENU (DEL_FLAG)
  tablespace USERS
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
create index SYS_MENU_PARENT_ID on SYS_MENU (PARENT_ID)
  tablespace USERS
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
create index SYS_MENU_PARENT_IDS on SYS_MENU (PARENT_IDS)
  tablespace USERS
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

prompt Creating SYS_OFFICE...
create table SYS_OFFICE
(
  ID             VARCHAR2(64) not null,
  PARENT_ID      VARCHAR2(64) not null,
  PARENT_IDS     VARCHAR2(2000) not null,
  NAME           NVARCHAR2(100) not null,
  SORT           NUMBER(10) not null,
  AREA_ID        VARCHAR2(64) not null,
  CODE           VARCHAR2(100),
  TYPE           CHAR(1) not null,
  GRADE          CHAR(1) not null,
  ADDRESS        NVARCHAR2(255),
  ZIP_CODE       VARCHAR2(100),
  MASTER         NVARCHAR2(100),
  PHONE          NVARCHAR2(200),
  FAX            NVARCHAR2(200),
  EMAIL          NVARCHAR2(200),
  USEABLE        VARCHAR2(64),
  PRIMARY_PERSON VARCHAR2(64),
  DEPUTY_PERSON  VARCHAR2(64),
  CREATE_BY      VARCHAR2(64) not null,
  CREATE_DATE    TIMESTAMP(6) not null,
  UPDATE_BY      VARCHAR2(64) not null,
  UPDATE_DATE    TIMESTAMP(6) not null,
  REMARKS        NVARCHAR2(255),
  DEL_FLAG       CHAR(1) default '0' not null
)
tablespace USERS
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
alter table SYS_OFFICE
  add primary key (ID)
  using index 
  tablespace USERS
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
create index SYS_OFFICE_DEL_FLAG on SYS_OFFICE (DEL_FLAG)
  tablespace USERS
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
create index SYS_OFFICE_PARENT_ID on SYS_OFFICE (PARENT_ID)
  tablespace USERS
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
create index SYS_OFFICE_PARENT_IDS on SYS_OFFICE (PARENT_IDS)
  tablespace USERS
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
create index SYS_OFFICE_TYPE on SYS_OFFICE (TYPE)
  tablespace USERS
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

prompt Creating SYS_ROLE...
create table SYS_ROLE
(
  ID          VARCHAR2(64) not null,
  OFFICE_ID   VARCHAR2(64),
  NAME        NVARCHAR2(100) not null,
  ENNAME      VARCHAR2(255),
  ROLE_TYPE   VARCHAR2(255),
  DATA_SCOPE  CHAR(1),
  IS_SYS      VARCHAR2(64),
  USEABLE     VARCHAR2(64),
  CREATE_BY   VARCHAR2(64) not null,
  CREATE_DATE TIMESTAMP(6) not null,
  UPDATE_BY   VARCHAR2(64) not null,
  UPDATE_DATE TIMESTAMP(6) not null,
  REMARKS     NVARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null
)
tablespace USERS
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
alter table SYS_ROLE
  add primary key (ID)
  using index 
  tablespace USERS
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
create index SYS_ROLE_DEL_FLAG on SYS_ROLE (DEL_FLAG)
  tablespace USERS
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
create index SYS_ROLE_ENNAME on SYS_ROLE (ENNAME)
  tablespace USERS
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

prompt Creating SYS_ROLE_MENU...
create table SYS_ROLE_MENU
(
  ROLE_ID VARCHAR2(64) not null,
  MENU_ID VARCHAR2(64) not null
)
tablespace USERS
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
alter table SYS_ROLE_MENU
  add primary key (ROLE_ID, MENU_ID)
  using index 
  tablespace USERS
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

prompt Creating SYS_ROLE_OFFICE...
create table SYS_ROLE_OFFICE
(
  ROLE_ID   VARCHAR2(64) not null,
  OFFICE_ID VARCHAR2(64) not null
)
tablespace USERS
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
alter table SYS_ROLE_OFFICE
  add primary key (ROLE_ID, OFFICE_ID)
  using index 
  tablespace USERS
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

prompt Creating SYS_USER...
create table SYS_USER
(
  ID          VARCHAR2(64) not null,
  COMPANY_ID  VARCHAR2(64) not null,
  OFFICE_ID   VARCHAR2(64) not null,
  LOGIN_NAME  VARCHAR2(100) not null,
  PASSWORD    VARCHAR2(100) not null,
  NO          VARCHAR2(100),
  NAME        NVARCHAR2(100) not null,
  EMAIL       NVARCHAR2(200),
  PHONE       VARCHAR2(200),
  MOBILE      VARCHAR2(200),
  USER_TYPE   CHAR(1),
  PHOTO       VARCHAR2(1000),
  LOGIN_IP    VARCHAR2(100),
  LOGIN_DATE  TIMESTAMP(6),
  LOGIN_FLAG  VARCHAR2(64),
  CREATE_BY   VARCHAR2(64) not null,
  CREATE_DATE TIMESTAMP(6) not null,
  UPDATE_BY   VARCHAR2(64) not null,
  UPDATE_DATE TIMESTAMP(6) not null,
  REMARKS     NVARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null
)
tablespace USERS
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
alter table SYS_USER
  add primary key (ID)
  using index 
  tablespace USERS
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
create index SYS_USER_COMPANY_ID on SYS_USER (COMPANY_ID)
  tablespace USERS
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
create index SYS_USER_DEL_FLAG on SYS_USER (DEL_FLAG)
  tablespace USERS
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
create index SYS_USER_LOGIN_NAME on SYS_USER (LOGIN_NAME)
  tablespace USERS
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
create index SYS_USER_OFFICE_ID on SYS_USER (OFFICE_ID)
  tablespace USERS
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
create index SYS_USER_UPDATE_DATE on SYS_USER (UPDATE_DATE)
  tablespace USERS
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

prompt Creating SYS_USER_ROLE...
create table SYS_USER_ROLE
(
  USER_ID VARCHAR2(64) not null,
  ROLE_ID VARCHAR2(64) not null
)
tablespace USERS
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
alter table SYS_USER_ROLE
  add primary key (USER_ID, ROLE_ID)
  using index 
  tablespace USERS
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

prompt Creating TEST_DATA...
create table TEST_DATA
(
  ID          VARCHAR2(64) not null,
  USER_ID     VARCHAR2(64),
  OFFICE_ID   VARCHAR2(64),
  AREA_ID     NVARCHAR2(64),
  NAME        NVARCHAR2(100),
  SEX         CHAR(1),
  IN_DATE     DATE,
  CREATE_BY   VARCHAR2(64) not null,
  CREATE_DATE TIMESTAMP(6) not null,
  UPDATE_BY   VARCHAR2(64) not null,
  UPDATE_DATE TIMESTAMP(6) not null,
  REMARKS     NVARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table TEST_DATA
  is '业务数据表';
comment on column TEST_DATA.ID
  is '编号';
comment on column TEST_DATA.USER_ID
  is '归属用户';
comment on column TEST_DATA.OFFICE_ID
  is '归属部门';
comment on column TEST_DATA.AREA_ID
  is '归属区域';
comment on column TEST_DATA.NAME
  is '名称';
comment on column TEST_DATA.SEX
  is '性别';
comment on column TEST_DATA.IN_DATE
  is '加入日期';
comment on column TEST_DATA.CREATE_BY
  is '创建者';
comment on column TEST_DATA.CREATE_DATE
  is '创建时间';
comment on column TEST_DATA.UPDATE_BY
  is '更新者';
comment on column TEST_DATA.UPDATE_DATE
  is '更新时间';
comment on column TEST_DATA.REMARKS
  is '备注信息';
comment on column TEST_DATA.DEL_FLAG
  is '删除标记';
alter table TEST_DATA
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index TEST_DATA_DEL_FLAG on TEST_DATA (DEL_FLAG)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating TEST_DATA_CHILD...
create table TEST_DATA_CHILD
(
  ID                VARCHAR2(64) not null,
  TEST_DATA_MAIN_ID VARCHAR2(64),
  NAME              NVARCHAR2(100),
  CREATE_BY         VARCHAR2(64) not null,
  CREATE_DATE       TIMESTAMP(6) not null,
  UPDATE_BY         VARCHAR2(64) not null,
  UPDATE_DATE       TIMESTAMP(6) not null,
  REMARKS           NVARCHAR2(255),
  DEL_FLAG          CHAR(1) default '0' not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table TEST_DATA_CHILD
  is '业务数据子表';
comment on column TEST_DATA_CHILD.ID
  is '编号';
comment on column TEST_DATA_CHILD.TEST_DATA_MAIN_ID
  is '业务主表ID';
comment on column TEST_DATA_CHILD.NAME
  is '名称';
comment on column TEST_DATA_CHILD.CREATE_BY
  is '创建者';
comment on column TEST_DATA_CHILD.CREATE_DATE
  is '创建时间';
comment on column TEST_DATA_CHILD.UPDATE_BY
  is '更新者';
comment on column TEST_DATA_CHILD.UPDATE_DATE
  is '更新时间';
comment on column TEST_DATA_CHILD.REMARKS
  is '备注信息';
comment on column TEST_DATA_CHILD.DEL_FLAG
  is '删除标记';
alter table TEST_DATA_CHILD
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index TEST_DATA_CHILD_DEL_FLAG on TEST_DATA_CHILD (DEL_FLAG)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating TEST_DATA_MAIN...
create table TEST_DATA_MAIN
(
  ID          VARCHAR2(64) not null,
  USER_ID     VARCHAR2(64),
  OFFICE_ID   VARCHAR2(64),
  AREA_ID     NVARCHAR2(64),
  NAME        NVARCHAR2(100),
  SEX         CHAR(1),
  IN_DATE     DATE,
  CREATE_BY   VARCHAR2(64) not null,
  CREATE_DATE TIMESTAMP(6) not null,
  UPDATE_BY   VARCHAR2(64) not null,
  UPDATE_DATE TIMESTAMP(6) not null,
  REMARKS     NVARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table TEST_DATA_MAIN
  is '业务数据表';
comment on column TEST_DATA_MAIN.ID
  is '编号';
comment on column TEST_DATA_MAIN.USER_ID
  is '归属用户';
comment on column TEST_DATA_MAIN.OFFICE_ID
  is '归属部门';
comment on column TEST_DATA_MAIN.AREA_ID
  is '归属区域';
comment on column TEST_DATA_MAIN.NAME
  is '名称';
comment on column TEST_DATA_MAIN.SEX
  is '性别';
comment on column TEST_DATA_MAIN.IN_DATE
  is '加入日期';
comment on column TEST_DATA_MAIN.CREATE_BY
  is '创建者';
comment on column TEST_DATA_MAIN.CREATE_DATE
  is '创建时间';
comment on column TEST_DATA_MAIN.UPDATE_BY
  is '更新者';
comment on column TEST_DATA_MAIN.UPDATE_DATE
  is '更新时间';
comment on column TEST_DATA_MAIN.REMARKS
  is '备注信息';
comment on column TEST_DATA_MAIN.DEL_FLAG
  is '删除标记';
alter table TEST_DATA_MAIN
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index TEST_DATA_MAIN_DEL_FLAG on TEST_DATA_MAIN (DEL_FLAG)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating TEST_TREE...
create table TEST_TREE
(
  ID          VARCHAR2(64) not null,
  PARENT_ID   VARCHAR2(64) not null,
  PARENT_IDS  VARCHAR2(2000) not null,
  NAME        NVARCHAR2(100) not null,
  SORT        NUMBER(10) not null,
  CREATE_BY   VARCHAR2(64) not null,
  CREATE_DATE TIMESTAMP(6) not null,
  UPDATE_BY   VARCHAR2(64) not null,
  UPDATE_DATE TIMESTAMP(6) not null,
  REMARKS     NVARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table TEST_TREE
  is '树结构表';
comment on column TEST_TREE.ID
  is '编号';
comment on column TEST_TREE.PARENT_ID
  is '父级编号';
comment on column TEST_TREE.PARENT_IDS
  is '所有父级编号';
comment on column TEST_TREE.NAME
  is '名称';
comment on column TEST_TREE.SORT
  is '排序';
comment on column TEST_TREE.CREATE_BY
  is '创建者';
comment on column TEST_TREE.CREATE_DATE
  is '创建时间';
comment on column TEST_TREE.UPDATE_BY
  is '更新者';
comment on column TEST_TREE.UPDATE_DATE
  is '更新时间';
comment on column TEST_TREE.REMARKS
  is '备注信息';
comment on column TEST_TREE.DEL_FLAG
  is '删除标记';
alter table TEST_TREE
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index TEST_DATA_PARENT_ID on TEST_TREE (PARENT_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index TEST_DATA_PARENT_IDS on TEST_TREE (PARENT_IDS)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index TEST_TREE_DEL_FLAG on TEST_TREE (DEL_FLAG)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;



prompt Creating GEN_TEMPLATE...
create table GEN_TEMPLATE
(
  ID          VARCHAR2(64) not null,
  NAME        NVARCHAR2(200),
  CATEGORY    VARCHAR2(2000),
  FILE_PATH   VARCHAR2(500),
  FILE_NAME   VARCHAR2(200),
  CONTENT     CLOB,
  CREATE_BY   VARCHAR2(64),
  CREATE_DATE TIMESTAMP(6),
  UPDATE_BY   VARCHAR2(64),
  UPDATE_DATE TIMESTAMP(6),
  REMARKS     NVARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
-- Add comments to the table 
comment on table GEN_TEMPLATE
  is '代码模板表';
-- Add comments to the columns 
comment on column GEN_TEMPLATE.ID
  is '编号';
comment on column GEN_TEMPLATE.NAME
  is '名称';
comment on column GEN_TEMPLATE.CATEGORY
  is '分类';
comment on column GEN_TEMPLATE.FILE_PATH
  is '生成文件路径';
comment on column GEN_TEMPLATE.FILE_NAME
  is '生成文件名';
comment on column GEN_TEMPLATE.CONTENT
  is '内容';
comment on column GEN_TEMPLATE.CREATE_BY
  is '创建者';
comment on column GEN_TEMPLATE.CREATE_DATE
  is '创建时间';
comment on column GEN_TEMPLATE.UPDATE_BY
  is '更新者';
comment on column GEN_TEMPLATE.UPDATE_DATE
  is '更新时间';
comment on column GEN_TEMPLATE.REMARKS
  is '备注信息';
comment on column GEN_TEMPLATE.DEL_FLAG
  is '删除标记（0：正常；1：删除）';
-- Create/Recreate primary, unique and foreign key constraints 
alter table GEN_TEMPLATE
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
-- Create/Recreate indexes 
create index GEN_TEMPLATE_DEL_FALG on GEN_TEMPLATE (DEL_FLAG)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;


prompt Creating SYS_LOG...
create table SYS_LOG
(
  ID          VARCHAR2(64) not null,
  TYPE        CHAR(1) default '1',
  TITLE       NVARCHAR2(500),
  CREATE_BY   VARCHAR2(64),
  CREATE_DATE TIMESTAMP(6),
  REMOTE_ADDR VARCHAR2(255),
  USER_AGENT  VARCHAR2(255),
  REQUEST_URI VARCHAR2(255),
  METHOD      VARCHAR2(5),
  PARAMS      CLOB,
  EXCEPTION   CLOB
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_LOG
  add primary key (ID)
  using index 
  tablespace USERS
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
-- Create/Recreate indexes 
create index SYS_LOG_CREATE_BY on SYS_LOG (CREATE_BY)
  tablespace USERS
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
create index SYS_LOG_CREATE_DATE on SYS_LOG (CREATE_DATE)
  tablespace USERS
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
create index SYS_LOG_REQUEST_URI on SYS_LOG (REQUEST_URI)
  tablespace USERS
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
create index SYS_LOG_TYPE on SYS_LOG (TYPE)
  tablespace USERS
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




prompt Loading GEN_SCHEME...
insert into GEN_SCHEME (ID, NAME, CATEGORY, PACKAGE_NAME, MODULE_NAME, SUB_MODULE_NAME, FUNCTION_NAME, FUNCTION_NAME_SIMPLE, FUNCTION_AUTHOR, GEN_TABLE_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9c9de9db6da743bb899036c6546061ac', '单表', 'curd', 'com.thinkgem.jeesite.modules', 'test', null, '单表生成', '单表', 'ThinkGem', 'aef6f1fc948f4c9ab1c1b780bc471cc2', '1', to_timestamp('08-12-2013 11:11:05.943000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:28:13.953000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_SCHEME (ID, NAME, CATEGORY, PACKAGE_NAME, MODULE_NAME, SUB_MODULE_NAME, FUNCTION_NAME, FUNCTION_NAME_SIMPLE, FUNCTION_AUTHOR, GEN_TABLE_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('e6d905fd236b46d1af581dd32bdfb3b0', '主子表', 'curd_many', 'com.thinkgem.jeesite.modules', 'test', null, '主子表生成', '主子表', 'ThinkGem', '43d6d5acffa14c258340ce6765e46c6f', '1', to_timestamp('08-12-2013 11:13:34.428000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:42:16.729000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_SCHEME (ID, NAME, CATEGORY, PACKAGE_NAME, MODULE_NAME, SUB_MODULE_NAME, FUNCTION_NAME, FUNCTION_NAME_SIMPLE, FUNCTION_AUTHOR, GEN_TABLE_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('35a13dc260284a728a270db3f382664b', '树结构', 'treeTable', 'com.thinkgem.jeesite.modules', 'test', null, '树结构生成', '树结构', 'ThinkGem', 'f6e4dafaa72f4c509636484715f33a96', '1', to_timestamp('08-12-2013 11:17:06.818000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 13:50:01.781000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 3 records loaded
prompt Loading GEN_TABLE...
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('aef6f1fc948f4c9ab1c1b780bc471cc2', 'test_data', '业务数据表', 'TestData', null, null, '1', to_timestamp('08-12-2013 11:10:28.984000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:28:00.511000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('43d6d5acffa14c258340ce6765e46c6f', 'test_data_main', '业务数据表', 'TestDataMain', null, null, '1', to_timestamp('08-12-2013 11:11:59.745000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:26:16.360000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6e05c389f3c6415ea34e55e9dfb28934', 'test_data_child', '业务数据子表', 'TestDataChild', 'test_data_main', 'test_data_main_id', '1', to_timestamp('08-12-2013 11:12:57.960000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:30:22.324000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('f6e4dafaa72f4c509636484715f33a96', 'test_tree', '树结构表', 'TestTree', null, null, '1', to_timestamp('08-12-2013 11:16:19.093000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 13:49:47.755000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 4 records loaded
prompt Loading GEN_TABLE_COLUMN...
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5e5c69bd3eaa4dcc9743f361f3771c08', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', to_timestamp('08-12-2013 11:10:29.017000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:28:00.513000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1d5ca4d114be41e99f8dc42a682ba609', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'user_id', '归属用户', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'user.id|name', '0', '1', '1', '1', '1', '1', '=', 'userselect', null, null, 2, '1', to_timestamp('08-12-2013 11:10:29.125000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:28:00.515000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('ad3bf0d4b44b4528a5211a66af88f322', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'office_id', '归属部门', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '1', '1', '1', '=', 'officeselect', null, null, 3, '1', to_timestamp('08-12-2013 11:10:29.128000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:28:00.517000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('71ea4bc10d274911b405f3165fc1bb1a', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'area_id', '归属区域', 'nvarchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '1', '1', '1', '=', 'areaselect', null, null, 4, '1', to_timestamp('08-12-2013 11:10:29.130000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:28:00.520000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4a0a1fff86ca46519477d66b82e01991', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 5, '1', to_timestamp('08-12-2013 11:10:29.131000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:28:00.522000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0902a0cb3e8f434280c20e9d771d0658', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '1', '1', '1', '1', '1', '=', 'radiobox', 'sex', null, 6, '1', to_timestamp('08-12-2013 11:10:29.133000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:28:00.524000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1b8eb55f65284fa6b0a5879b6d8ad3ec', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'in_date', '加入日期', 'date(7)', 'java.util.Date', 'inDate', '0', '1', '1', '1', '0', '1', 'between', 'dateselect', null, null, 7, '1', to_timestamp('08-12-2013 11:10:29.134000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:28:00.526000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('398b4a03f06940bfb979ca574e1911e3', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 8, '1', to_timestamp('08-12-2013 11:10:29.136000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:28:00.700000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('103fc05c88ff40639875c2111881996a', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 9, '1', to_timestamp('08-12-2013 11:10:29.137000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:28:00.717000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5a4a1933c9c844fdba99de043dc8205e', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 10, '1', to_timestamp('08-12-2013 11:10:29.138000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:28:00.721000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('eb2e5afd13f147a990d30e68e7f64e12', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 11, '1', to_timestamp('08-12-2013 11:10:29.140000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:28:00.723000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8da38dbe5fe54e9bb1f9682c27fbf403', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 12, '1', to_timestamp('08-12-2013 11:10:29.142000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:28:00.724000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('35af241859624a01917ab64c3f4f0813', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 13, '1', to_timestamp('08-12-2013 11:10:29.144000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:28:00.726000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('19c6478b8ff54c60910c2e4fc3d27503', '43d6d5acffa14c258340ce6765e46c6f', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', to_timestamp('08-12-2013 11:11:59.747000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:26:16.362000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8b9de88df53e485d8ef461c4b1824bc1', '43d6d5acffa14c258340ce6765e46c6f', 'user_id', '归属用户', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'user.id|name', '0', '1', '1', '1', '1', '1', '=', 'userselect', null, null, 2, '1', to_timestamp('08-12-2013 11:11:59.749000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:26:16.365000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('ca68a2d403f0449cbaa1d54198c6f350', '43d6d5acffa14c258340ce6765e46c6f', 'office_id', '归属部门', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '1', '0', '0', '=', 'officeselect', null, null, 3, '1', to_timestamp('08-12-2013 11:11:59.751000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:26:16.367000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3a7cf23ae48a4c849ceb03feffc7a524', '43d6d5acffa14c258340ce6765e46c6f', 'area_id', '归属区域', 'nvarchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '1', '0', '0', '=', 'areaselect', null, null, 4, '1', to_timestamp('08-12-2013 11:11:59.754000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:26:16.372000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('67d0331f809a48ee825602659f0778e8', '43d6d5acffa14c258340ce6765e46c6f', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 5, '1', to_timestamp('08-12-2013 11:11:59.756000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:26:16.374000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('d5c2d932ae904aa8a9f9ef34cd36fb0b', '43d6d5acffa14c258340ce6765e46c6f', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '1', '1', '1', '0', '1', '=', 'select', 'sex', null, 6, '1', to_timestamp('08-12-2013 11:11:59.757000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:26:16.376000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1ac6562f753d4e599693840651ab2bf7', '43d6d5acffa14c258340ce6765e46c6f', 'in_date', '加入日期', 'date(7)', 'java.util.Date', 'inDate', '0', '1', '1', '1', '0', '0', '=', 'dateselect', null, null, 7, '1', to_timestamp('08-12-2013 11:11:59.758000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:26:16.378000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8b48774cfe184913b8b5eb17639cf12d', '43d6d5acffa14c258340ce6765e46c6f', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 8, '1', to_timestamp('08-12-2013 11:11:59.760000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:26:16.379000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4c8ef12cb6924b9ba44048ba9913150b', '43d6d5acffa14c258340ce6765e46c6f', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 9, '1', to_timestamp('08-12-2013 11:11:59.761000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:26:16.381000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('21756504ffdc487eb167a823f89c0c06', '43d6d5acffa14c258340ce6765e46c6f', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 10, '1', to_timestamp('08-12-2013 11:11:59.763000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:26:16.383000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3d9c32865bb44e85af73381df0ffbf3d', '43d6d5acffa14c258340ce6765e46c6f', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 11, '1', to_timestamp('08-12-2013 11:11:59.764000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:26:16.385000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('cb9c0ec3da26432d9cbac05ede0fd1d0', '43d6d5acffa14c258340ce6765e46c6f', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 12, '1', to_timestamp('08-12-2013 11:11:59.765000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:26:16.386000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('e8d11127952d4aa288bb3901fc83127f', '43d6d5acffa14c258340ce6765e46c6f', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 13, '1', to_timestamp('08-12-2013 11:11:59.767000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:26:16.388000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('33152ce420904594b3eac796a27f0560', '6e05c389f3c6415ea34e55e9dfb28934', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', to_timestamp('08-12-2013 11:12:57.962000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:30:22.326000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('68345713bef3445c906f70e68f55de38', '6e05c389f3c6415ea34e55e9dfb28934', 'test_data_main_id', '业务主表', 'varchar2(64)', 'String', 'testDataMain.id', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 2, '1', to_timestamp('08-12-2013 11:12:57.964000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:30:22.327000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('e64050a2ebf041faa16f12dda5dcf784', '6e05c389f3c6415ea34e55e9dfb28934', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 3, '1', to_timestamp('08-12-2013 11:12:57.966000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:30:22.329000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('12fa38dd986e41908f7fefa5839d1220', '6e05c389f3c6415ea34e55e9dfb28934', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 4, '1', to_timestamp('08-12-2013 11:12:57.967000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:30:22.330000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8b7cf0525519474ebe1de9e587eb7067', '6e05c389f3c6415ea34e55e9dfb28934', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 5, '1', to_timestamp('08-12-2013 11:12:57.968000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:30:22.332000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('56fa71c0bd7e4132931874e548dc9ba5', '6e05c389f3c6415ea34e55e9dfb28934', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 6, '1', to_timestamp('08-12-2013 11:12:57.969000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:30:22.333000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('652491500f2641ffa7caf95a93e64d34', '6e05c389f3c6415ea34e55e9dfb28934', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 7, '1', to_timestamp('08-12-2013 11:12:57.971000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:30:22.334000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('7f871058d94c4d9a89084be7c9ce806d', '6e05c389f3c6415ea34e55e9dfb28934', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'input', null, null, 8, '1', to_timestamp('08-12-2013 11:12:57.973000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:30:22.335000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('53d65a3d306d4fac9e561db9d3c66912', '6e05c389f3c6415ea34e55e9dfb28934', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 9, '1', to_timestamp('08-12-2013 11:12:57.975000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 11:30:22.337000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('cfcfa06ea61749c9b4c4dbc507e0e580', 'f6e4dafaa72f4c509636484715f33a96', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', to_timestamp('08-12-2013 11:16:19.095000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 13:49:47.756000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9a012c1d2f934dbf996679adb7cc827a', 'f6e4dafaa72f4c509636484715f33a96', 'parent_id', '父级编号', 'varchar2(64)', 'This', 'parent.id|name', '0', '0', '1', '1', '0', '0', '=', 'treeselect', null, null, 2, '1', to_timestamp('08-12-2013 11:16:19.096000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 13:49:47.759000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('24bbdc0a555e4412a106ab1c5f03008e', 'f6e4dafaa72f4c509636484715f33a96', 'parent_ids', '所有父级编号', 'varchar2(2000)', 'String', 'parentIds', '0', '0', '1', '1', '0', '0', 'like', 'input', null, null, 3, '1', to_timestamp('08-12-2013 11:16:19.098000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 13:49:47.761000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('633f5a49ec974c099158e7b3e6bfa930', 'f6e4dafaa72f4c509636484715f33a96', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', 'like', 'input', null, null, 4, '1', to_timestamp('08-12-2013 11:16:19.115000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 13:49:47.763000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6763ff6dc7cd4c668e76cf9b697d3ff6', 'f6e4dafaa72f4c509636484715f33a96', 'sort', '排序', 'number(10)', 'Integer', 'sort', '0', '0', '1', '1', '1', '0', '=', 'input', null, null, 5, '1', to_timestamp('08-12-2013 11:16:19.116000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 13:49:47.764000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('195ee9241f954d008fe01625f4adbfef', 'f6e4dafaa72f4c509636484715f33a96', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 6, '1', to_timestamp('08-12-2013 11:16:19.117000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 13:49:47.766000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('92481c16a0b94b0e8bba16c3c54eb1e4', 'f6e4dafaa72f4c509636484715f33a96', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 7, '1', to_timestamp('08-12-2013 11:16:19.118000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 13:49:47.768000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('bb1256a8d1b741f6936d8fed06f45eed', 'f6e4dafaa72f4c509636484715f33a96', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 8, '1', to_timestamp('08-12-2013 11:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 13:49:47.770000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('416c76d2019b4f76a96d8dc3a8faf84c', 'f6e4dafaa72f4c509636484715f33a96', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 9, '1', to_timestamp('08-12-2013 11:16:19.120000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 13:49:47.772000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('f5ed8c82bad0413fbfcccefa95931358', 'f6e4dafaa72f4c509636484715f33a96', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 10, '1', to_timestamp('08-12-2013 11:16:19.121000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 13:49:47.774000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('46e6d8283270493687085d29efdecb05', 'f6e4dafaa72f4c509636484715f33a96', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 11, '1', to_timestamp('08-12-2013 11:16:19.122000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 13:49:47.775000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 46 records loaded
prompt Loading SYS_AREA...
insert into SYS_AREA (ID, PARENT_ID, PARENT_IDS, NAME, SORT, CODE, TYPE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1', '0', '0,', '中国', 10, '100000', '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_AREA (ID, PARENT_ID, PARENT_IDS, NAME, SORT, CODE, TYPE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('2', '1', '0,1,', '山东省', 20, '110000', '2', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_AREA (ID, PARENT_ID, PARENT_IDS, NAME, SORT, CODE, TYPE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3', '2', '0,1,2,', '济南市', 30, '110101', '3', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_AREA (ID, PARENT_ID, PARENT_IDS, NAME, SORT, CODE, TYPE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4', '3', '0,1,2,3,', '历城区', 40, '110102', '4', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_AREA (ID, PARENT_ID, PARENT_IDS, NAME, SORT, CODE, TYPE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5', '3', '0,1,2,3,', '历下区', 50, '110104', '4', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_AREA (ID, PARENT_ID, PARENT_IDS, NAME, SORT, CODE, TYPE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6', '3', '0,1,2,3,', '高新区', 60, '110105', '4', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 6 records loaded
prompt Loading SYS_DICT...
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1', '0', '正常', 'del_flag', '删除标记', 10, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('2', '1', '删除', 'del_flag', '删除标记', 20, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3', '1', '显示', 'show_hide', '显示/隐藏', 10, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4', '0', '隐藏', 'show_hide', '显示/隐藏', 20, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5', '1', '是', 'yes_no', '是/否', 10, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6', '0', '否', 'yes_no', '是/否', 20, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('7', 'red', '红色', 'color', '颜色值', 10, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8', 'green', '绿色', 'color', '颜色值', 20, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9', 'blue', '蓝色', 'color', '颜色值', 30, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('10', 'yellow', '黄色', 'color', '颜色值', 40, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('11', 'orange', '橙色', 'color', '颜色值', 50, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('12', 'default', '默认主题', 'theme', '主题方案', 10, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', 20, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('14', 'readable', '橙色主题', 'theme', '主题方案', 30, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('15', 'united', '红色主题', 'theme', '主题方案', 40, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('16', 'flat', 'Flat主题', 'theme', '主题方案', 60, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('17', '1', '国家', 'sys_area_type', '区域类型', 10, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', 20, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('19', '3', '地市', 'sys_area_type', '区域类型', 30, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('20', '4', '区县', 'sys_area_type', '区域类型', 40, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('21', '1', '公司', 'sys_office_type', '机构类型', 60, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('22', '2', '部门', 'sys_office_type', '机构类型', 70, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('23', '3', '小组', 'sys_office_type', '机构类型', 80, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('24', '4', '其它', 'sys_office_type', '机构类型', 90, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', 30, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', 40, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', 50, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('28', '1', '一级', 'sys_office_grade', '机构等级', 10, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('29', '2', '二级', 'sys_office_grade', '机构等级', 20, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('30', '3', '三级', 'sys_office_grade', '机构等级', 30, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('31', '4', '四级', 'sys_office_grade', '机构等级', 40, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('32', '1', '所有数据', 'sys_data_scope', '数据范围', 10, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', 20, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', 30, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', 40, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', 50, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', 90, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', 100, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('39', '1', '系统管理', 'sys_user_type', '用户类型', 10, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('40', '2', '部门经理', 'sys_user_type', '用户类型', 20, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('41', '3', '普通用户', 'sys_user_type', '用户类型', 30, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('42', 'basic', '基础主题', 'cms_theme', '站点主题', 10, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('43', 'blue', '蓝色主题', 'cms_theme', '站点主题', 20, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('44', 'red', '红色主题', 'cms_theme', '站点主题', 30, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('45', 'article', '文章模型', 'cms_module', '栏目模型', 10, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('46', 'picture', '图片模型', 'cms_module', '栏目模型', 20, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('47', 'download', '下载模型', 'cms_module', '栏目模型', 30, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('48', 'link', '链接模型', 'cms_module', '栏目模型', 40, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('49', 'special', '专题模型', 'cms_module', '栏目模型', 50, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('50', '0', '默认展现方式', 'cms_show_modes', '展现方式', 10, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('51', '1', '首栏目内容列表', 'cms_show_modes', '展现方式', 20, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('52', '2', '栏目第一条内容', 'cms_show_modes', '展现方式', 30, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('53', '0', '发布', 'cms_del_flag', '内容状态', 10, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('54', '1', '删除', 'cms_del_flag', '内容状态', 20, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('55', '2', '审核', 'cms_del_flag', '内容状态', 15, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('56', '1', '首页焦点图', 'cms_posid', '推荐位', 10, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('57', '2', '栏目页文章推荐', 'cms_posid', '推荐位', 20, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('58', '1', '咨询', 'cms_guestbook', '留言板分类', 10, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('59', '2', '建议', 'cms_guestbook', '留言板分类', 20, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('60', '3', '投诉', 'cms_guestbook', '留言板分类', 30, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('61', '4', '其它', 'cms_guestbook', '留言板分类', 40, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('62', '1', '公休', 'oa_leave_type', '请假类型', 10, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('63', '2', '病假', 'oa_leave_type', '请假类型', 20, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('64', '3', '事假', 'oa_leave_type', '请假类型', 30, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('65', '4', '调休', 'oa_leave_type', '请假类型', 40, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('66', '5', '婚假', 'oa_leave_type', '请假类型', 60, '0', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('67', '1', '接入日志', 'sys_log_type', '日志类型', 30, '0', '1', to_timestamp('03-06-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('03-06-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('68', '2', '异常日志', 'sys_log_type', '日志类型', 40, '0', '1', to_timestamp('03-06-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('03-06-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('69', 'leave', '请假流程', 'act_type', '流程类型', 10, '0', '1', to_timestamp('03-06-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('03-06-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('70', 'test_audit', '审批测试流程', 'act_type', '流程类型', 20, '0', '1', to_timestamp('03-06-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('03-06-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('71', '1', '分类1', 'act_category', '流程分类', 10, '0', '1', to_timestamp('03-06-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('03-06-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('72', '2', '分类2', 'act_category', '流程分类', 20, '0', '1', to_timestamp('03-06-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('03-06-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('73', 'crud', '增删改查', 'gen_category', '代码生成分类', 10, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('74', 'crud_many', '增删改查（包含从表）', 'gen_category', '代码生成分类', 20, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('75', 'tree', '树结构', 'gen_category', '代码生成分类', 30, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('76', '=', '=', 'gen_query_type', '查询方式', 10, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('77', '!=', '!=', 'gen_query_type', '查询方式', 20, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', 30, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', 40, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('80', 'between', 'Between', 'gen_query_type', '查询方式', 50, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('81', 'like', 'Like', 'gen_query_type', '查询方式', 60, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('82', 'left_like', 'Left Like', 'gen_query_type', '查询方式', 70, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('83', 'right_like', 'Right Like', 'gen_query_type', '查询方式', 80, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('84', 'input', '文本框', 'gen_show_type', '字段生成方案', 10, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('85', 'textarea', '文本域', 'gen_show_type', '字段生成方案', 20, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('86', 'select', '下拉框', 'gen_show_type', '字段生成方案', 30, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('87', 'checkbox', '复选框', 'gen_show_type', '字段生成方案', 40, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('88', 'radiobox', '单选框', 'gen_show_type', '字段生成方案', 50, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('89', 'dateselect', '日期选择', 'gen_show_type', '字段生成方案', 60, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('90', 'userselect', '人员选择', 'gen_show_type', '字段生成方案', 70, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('91', 'officeselect', '部门选择', 'gen_show_type', '字段生成方案', 80, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('92', 'areaselect', '区域选择', 'gen_show_type', '字段生成方案', 90, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('93', 'String', 'String', 'gen_java_type', 'Java类型', 10, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', 20, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('95', 'dao', '仅持久层', 'gen_category', '代码生成分类' || chr(0) || '' || chr(0) || '' || chr(0) || '' || chr(0) || '' || chr(0) || '' || chr(0) || '', 40, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('96', '1', '男', 'sex', '性别', 10, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('97', '2', '女', 'sex', '性别', 20, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型' || chr(0) || '' || chr(0) || '', 30, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('99', 'Double', 'Double', 'gen_java_type', 'Java类型' || chr(0) || '' || chr(0) || '', 40, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('100', 'java.util.Date', 'Date', 'gen_java_type', 'Java类型' || chr(0) || '' || chr(0) || '', 50, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
commit;
prompt 100 records committed...
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('101', 'com.thinkgem.jeesite.modules.sys.entity.User', 'User', 'gen_java_type', 'Java类型' || chr(0) || '' || chr(0) || '', 60, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('102', 'com.thinkgem.jeesite.modules.sys.entity.Office', 'Office', 'gen_java_type', 'Java类型' || chr(0) || '' || chr(0) || '', 70, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('103', 'com.thinkgem.jeesite.modules.sys.entity.Area', 'Area', 'gen_java_type', 'Java类型' || chr(0) || '' || chr(0) || '', 80, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型' || chr(0) || '' || chr(0) || '', 90, '0', '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('28-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('105', '1', '会议通告', 'oa_notify_type', '通知通告类型', 10, '0', '1', to_timestamp('08-11-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-11-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('106', '2', '奖惩通告', 'oa_notify_type', '通知通告类型', 20, '0', '1', to_timestamp('08-11-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-11-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('107', '3', '活动通告', 'oa_notify_type', '通知通告类型', 30, '0', '1', to_timestamp('08-11-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-11-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('108', '0', '草稿', 'oa_notify_status', '通知通告状态', 10, '0', '1', to_timestamp('08-11-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-11-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('109', '1', '发布', 'oa_notify_status', '通知通告状态', 20, '0', '1', to_timestamp('08-11-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-11-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('110', '0', '未读', 'oa_notify_read', '通知通告状态', 10, '0', '1', to_timestamp('08-11-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-11-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('111', '1', '已读', 'oa_notify_read', '通知通告状态', 20, '0', '1', to_timestamp('08-11-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-11-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 111 records loaded
prompt Loading SYS_MDICT...
prompt Table is empty
prompt Loading SYS_MENU...
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3c92c17886944d0687e73e286cada573', '79', '0,1,79,', '生成示例', 120, null, null, null, '1', null, '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('ba8092291b40482db8fe7fc006ea3d76', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '单表', 30, '/test/testData', null, null, '1', null, '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0b2ebd4d639e4c2b83c2dd0764522f24', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '编辑', 60, null, null, null, '0', 'test:testData:edit', '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('df7ce823c5b24ff9bada43d992f373e2', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '查看', 30, null, null, null, '0', 'test:testData:view', '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('b1f6d1b86ba24365bae7fd86c5082317', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '主子表', 60, '/test/testDataMain', null, null, '1', null, '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4855cf3b25c244fb8500a380db189d97', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '查看', 30, null, null, null, '0', 'test:testDataMain:view', '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('d15ec45a4c5449c3bbd7a61d5f9dd1d2', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '编辑', 60, null, null, null, '0', 'test:testDataMain:edit', '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0ca004d6b1bf4bcab9670a5060d82a55', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '树结构', 90, '/test/testTree', null, null, '1', null, '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('c2e4d9082a0b4386884a0b203afe2c5c', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '查看', 30, null, null, null, '0', 'test:testTree:view', '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('afab2db430e2457f9cf3a11feaa8b869', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '编辑', 60, null, null, null, '0', 'test:testTree:edit', '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-12-2013 15:16:19.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1', '0', '0,', '功能菜单', 0, null, null, null, '1', null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('2', '1', '0,1,', '系统设置', 900, null, null, null, '1', null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3', '2', '0,1,2,', '系统设置', 980, null, null, null, '1', null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4', '3', '0,1,2,3,', '菜单管理', 30, '/sys/menu/', null, 'list-alt', '1', null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5', '4', '0,1,2,3,4,', '查看', 30, null, null, null, '0', 'sys:menu:view', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6', '4', '0,1,2,3,4,', '修改', 40, null, null, null, '0', 'sys:menu:edit', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('7', '3', '0,1,2,3,', '角色管理', 50, '/sys/role/', null, 'lock', '1', null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8', '7', '0,1,2,3,7,', '查看', 30, null, null, null, '0', 'sys:role:view', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9', '7', '0,1,2,3,7,', '修改', 40, null, null, null, '0', 'sys:role:edit', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('10', '3', '0,1,2,3,', '字典管理', 60, '/sys/dict/', null, 'th-list', '1', null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('11', '10', '0,1,2,3,10,', '查看', 30, null, null, null, '0', 'sys:dict:view', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('12', '10', '0,1,2,3,10,', '修改', 40, null, null, null, '0', 'sys:dict:edit', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('13', '2', '0,1,2,', '机构用户', 970, null, null, null, '1', null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('14', '13', '0,1,2,13,', '区域管理', 50, '/sys/area/', null, 'th', '1', null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('15', '14', '0,1,2,13,14,', '查看', 30, null, null, null, '0', 'sys:area:view', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('16', '14', '0,1,2,13,14,', '修改', 40, null, null, null, '0', 'sys:area:edit', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('17', '13', '0,1,2,13,', '机构管理', 40, '/sys/office/', null, 'th-large', '1', null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('18', '17', '0,1,2,13,17,', '查看', 30, null, null, null, '0', 'sys:office:view', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('19', '17', '0,1,2,13,17,', '修改', 40, null, null, null, '0', 'sys:office:edit', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('20', '13', '0,1,2,13,', '用户管理', 30, '/sys/user/index', null, 'user', '1', null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('21', '20', '0,1,2,13,20,', '查看', 30, null, null, null, '0', 'sys:user:view', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('22', '20', '0,1,2,13,20,', '修改', 40, null, null, null, '0', 'sys:user:edit', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('23', '2', '0,1,2,', '关于帮助', 990, null, null, null, '0', null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('24', '23', '0,1,2,23', '官方首页', 30, 'http://jeesite.com', '_blank', null, '0', null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('27', '1', '0,1,', '我的面板', 100, null, null, null, '1', null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('28', '27', '0,1,27,', '个人信息', 30, null, null, null, '1', null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('29', '28', '0,1,27,28,', '个人信息', 30, '/sys/user/info', null, 'user', '1', null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('30', '28', '0,1,27,28,', '修改密码', 40, '/sys/user/modifyPwd', null, 'lock', '1', null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('56', '71', '0,1,27,71,', '文件管理', 90, '/../static/ckfinder/ckfinder.html', null, 'folder-open', '1', null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('57', '56', '0,1,27,40,56,', '查看', 30, null, null, null, '0', 'cms:ckfinder:view', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('58', '56', '0,1,27,40,56,', '上传', 40, null, null, null, '0', 'cms:ckfinder:upload', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('59', '56', '0,1,27,40,56,', '修改', 50, null, null, null, '0', 'cms:ckfinder:edit', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('67', '2', '0,1,2,', '日志查询', 985, null, null, null, '1', null, '1', to_timestamp('03-06-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('03-06-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('68', '67', '0,1,2,67,', '日志查询', 30, '/sys/log', null, 'pencil', '1', 'sys:log:view', '1', to_timestamp('03-06-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('03-06-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('71', '27', '0,1,27,', '文件管理', 90, null, null, null, '1', null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('79', '1', '0,1,', '代码生成', 5000, null, null, null, '1', null, '1', to_timestamp('16-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('16-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('80', '79', '0,1,79,', '代码生成', 50, null, null, null, '1', null, '1', to_timestamp('16-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('16-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('81', '80', '0,1,79,80,', '生成方案配置', 30, '/gen/genScheme', null, null, '1', 'gen:genScheme:view,gen:genScheme:edit', '1', to_timestamp('16-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('16-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('82', '80', '0,1,79,80,', '业务表配置', 20, '/gen/genTable', null, null, '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', to_timestamp('16-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('16-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('84', '67', '0,1,2,67,', '连接池监视', 40, '/../druid', null, null, '1', null, '1', to_timestamp('18-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('18-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('85', '76', '0,1,75,76,', '行政区域', 80, '/../static/map/map-city.html', null, null, '1', null, '1', to_timestamp('22-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('22-10-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 51 records loaded
prompt Loading SYS_OFFICE...
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1', '0', '0,', '山东省总公司', 10, '2', '100000', '1', '1', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('2', '1', '0,1,', '公司领导', 10, '2', '100001', '2', '1', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3', '1', '0,1,', '综合部', 20, '2', '100002', '2', '1', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4', '1', '0,1,', '市场部', 30, '2', '100003', '2', '1', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5', '1', '0,1,', '技术部', 40, '2', '100004', '2', '1', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6', '1', '0,1,', '研发部', 50, '2', '100005', '2', '1', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('7', '1', '0,1,', '济南市分公司', 20, '3', '200000', '1', '2', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8', '7', '0,1,7,', '公司领导', 10, '3', '200001', '2', '2', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9', '7', '0,1,7,', '综合部', 20, '3', '200002', '2', '2', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('10', '7', '0,1,7,', '市场部', 30, '3', '200003', '2', '2', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('11', '7', '0,1,7,', '技术部', 40, '3', '200004', '2', '2', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('12', '7', '0,1,7,', '历城区分公司', 0, '4', '201000', '1', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('13', '12', '0,1,7,12,', '公司领导', 10, '4', '201001', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('14', '12', '0,1,7,12,', '综合部', 20, '4', '201002', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('15', '12', '0,1,7,12,', '市场部', 30, '4', '201003', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('16', '12', '0,1,7,12,', '技术部', 40, '4', '201004', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('17', '7', '0,1,7,', '历下区分公司', 40, '5', '201010', '1', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('18', '17', '0,1,7,17,', '公司领导', 10, '5', '201011', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('19', '17', '0,1,7,17,', '综合部', 20, '5', '201012', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('20', '17', '0,1,7,17,', '市场部', 30, '5', '201013', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('21', '17', '0,1,7,17,', '技术部', 40, '5', '201014', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('22', '7', '0,1,7,', '高新区分公司', 50, '6', '201010', '1', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('23', '22', '0,1,7,22,', '公司领导', 10, '6', '201011', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('24', '22', '0,1,7,22,', '综合部', 20, '6', '201012', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('25', '22', '0,1,7,22,', '市场部', 30, '6', '201013', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('26', '22', '0,1,7,22,', '技术部', 40, '6', '201014', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 26 records loaded
prompt Loading SYS_ROLE...
insert into SYS_ROLE (ID, OFFICE_ID, NAME, ENNAME, ROLE_TYPE, DATA_SCOPE, IS_SYS, USEABLE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1', '1', '系统管理员', 'dept', 'assignment', '1', null, '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_ROLE (ID, OFFICE_ID, NAME, ENNAME, ROLE_TYPE, DATA_SCOPE, IS_SYS, USEABLE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('2', '1', '公司管理员', 'hr', 'assignment', '2', null, '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_ROLE (ID, OFFICE_ID, NAME, ENNAME, ROLE_TYPE, DATA_SCOPE, IS_SYS, USEABLE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3', '1', '本公司管理员', 'a', 'assignment', '3', null, '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_ROLE (ID, OFFICE_ID, NAME, ENNAME, ROLE_TYPE, DATA_SCOPE, IS_SYS, USEABLE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4', '1', '部门管理员', 'b', 'assignment', '4', null, '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_ROLE (ID, OFFICE_ID, NAME, ENNAME, ROLE_TYPE, DATA_SCOPE, IS_SYS, USEABLE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5', '1', '本部门管理员', 'c', 'assignment', '5', null, '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_ROLE (ID, OFFICE_ID, NAME, ENNAME, ROLE_TYPE, DATA_SCOPE, IS_SYS, USEABLE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6', '1', '普通用户', 'd', 'assignment', '8', null, '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_ROLE (ID, OFFICE_ID, NAME, ENNAME, ROLE_TYPE, DATA_SCOPE, IS_SYS, USEABLE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('7', '7', '济南市管理员', 'e', 'assignment', '9', null, '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 7 records loaded
prompt Loading SYS_ROLE_MENU...
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '1');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '10');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '12');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '13');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '14');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '15');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '17');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '18');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '19');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '20');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '21');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '22');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '23');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '24');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '25');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '26');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '27');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '28');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '29');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '30');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '31');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '32');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '33');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '34');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '35');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '36');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '37');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '38');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '39');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '4');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '40');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '41');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '42');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '43');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '44');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '45');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '46');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '47');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '48');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '49');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '5');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '50');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '51');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '52');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '53');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '54');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '56');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '57');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '58');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '59');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '6');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '60');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '61');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '62');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '63');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '64');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '65');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '66');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '67');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '68');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '69');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '7');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '70');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '71');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '72');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '73');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '74');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '75');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '76');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '77');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '78');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '79');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '8');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '80');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '81');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '82');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '83');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '84');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '85');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '86');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '87');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '88');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '89');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '9');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '90');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '1');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '10');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '12');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '13');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '14');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '15');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '17');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '18');
commit;
prompt 100 records committed...
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '19');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '20');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '21');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '22');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '23');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '24');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '25');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '26');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '27');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '28');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '29');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '30');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '31');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '32');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '33');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '34');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '35');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '36');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '37');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '38');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '39');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '4');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '40');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '41');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '42');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '43');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '44');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '45');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '46');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '47');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '48');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '49');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '5');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '50');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '51');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '52');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '53');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '54');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '56');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '57');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '58');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '59');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '6');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '60');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '61');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '62');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '63');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '64');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '65');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '66');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '67');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '68');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '69');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '7');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '70');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '71');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '72');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '73');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '74');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '75');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '76');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '77');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '78');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '79');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '8');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '80');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '81');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '82');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '83');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '84');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '85');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '86');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '87');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '88');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '89');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '9');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '90');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '1');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '10');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '12');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '13');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '14');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '15');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '17');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '18');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '19');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '20');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '21');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '22');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '23');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '24');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '25');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '26');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '27');
commit;
prompt 200 records committed...
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '28');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '29');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '30');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '31');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '32');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '33');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '34');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '35');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '36');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '37');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '38');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '39');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '4');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '40');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '41');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '42');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '43');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '44');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '45');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '46');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '47');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '48');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '49');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '5');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '50');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '51');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '52');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '53');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '54');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '56');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '57');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '58');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '59');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '6');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '60');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '61');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '62');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '63');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '64');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '65');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '66');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '67');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '68');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '69');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '7');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '70');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '71');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '72');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '73');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '74');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '75');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '76');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '77');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '78');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '79');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '8');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '80');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '81');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '82');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '83');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '84');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '85');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '86');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '87');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '88');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '89');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '9');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '90');
commit;
prompt 270 records loaded
prompt Loading SYS_ROLE_OFFICE...
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '10');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '11');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '12');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '13');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '14');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '15');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '16');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '17');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '18');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '19');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '20');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '21');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '22');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '23');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '24');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '25');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '26');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '7');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '8');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '9');
commit;
prompt 20 records loaded
prompt Loading SYS_USER...
insert into SYS_USER (ID, COMPANY_ID, OFFICE_ID, LOGIN_NAME, PASSWORD, NO, NAME, EMAIL, PHONE, MOBILE, USER_TYPE, PHOTO, LOGIN_IP, LOGIN_DATE, LOGIN_FLAG, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1', '1', '2', 'admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0001', '系统管理员', 'thinkgem@163.com', '8675', '8675', null, '/userfiles/1/images/photo/2017/10/userface4.jpg', '0:0:0:0:0:0:0:1', to_timestamp('08-11-2017 13:57:04.195000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('01-11-2017 16:55:28.620000', 'dd-mm-yyyy hh24:mi:ss.ff'), '最高管理员', '0');
insert into SYS_USER (ID, COMPANY_ID, OFFICE_ID, LOGIN_NAME, PASSWORD, NO, NAME, EMAIL, PHONE, MOBILE, USER_TYPE, PHOTO, LOGIN_IP, LOGIN_DATE, LOGIN_FLAG, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('2', '1', '2', 'sd_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0002', '管理员', null, null, null, null, null, null, null, '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (ID, COMPANY_ID, OFFICE_ID, LOGIN_NAME, PASSWORD, NO, NAME, EMAIL, PHONE, MOBILE, USER_TYPE, PHOTO, LOGIN_IP, LOGIN_DATE, LOGIN_FLAG, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3', '1', '3', 'sd_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0003', '综合部', null, null, null, null, null, null, null, '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (ID, COMPANY_ID, OFFICE_ID, LOGIN_NAME, PASSWORD, NO, NAME, EMAIL, PHONE, MOBILE, USER_TYPE, PHOTO, LOGIN_IP, LOGIN_DATE, LOGIN_FLAG, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4', '1', '4', 'sd_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0004', '市场部', null, null, null, null, null, null, null, '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (ID, COMPANY_ID, OFFICE_ID, LOGIN_NAME, PASSWORD, NO, NAME, EMAIL, PHONE, MOBILE, USER_TYPE, PHOTO, LOGIN_IP, LOGIN_DATE, LOGIN_FLAG, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5', '1', '5', 'sd_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0005', '技术部', null, null, null, null, null, null, null, '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (ID, COMPANY_ID, OFFICE_ID, LOGIN_NAME, PASSWORD, NO, NAME, EMAIL, PHONE, MOBILE, USER_TYPE, PHOTO, LOGIN_IP, LOGIN_DATE, LOGIN_FLAG, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6', '1', '6', 'sd_yfb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0006', '研发部', null, null, null, null, null, null, null, '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (ID, COMPANY_ID, OFFICE_ID, LOGIN_NAME, PASSWORD, NO, NAME, EMAIL, PHONE, MOBILE, USER_TYPE, PHOTO, LOGIN_IP, LOGIN_DATE, LOGIN_FLAG, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('7', '7', '8', 'jn_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0007', '济南领导', null, null, null, null, null, null, null, '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (ID, COMPANY_ID, OFFICE_ID, LOGIN_NAME, PASSWORD, NO, NAME, EMAIL, PHONE, MOBILE, USER_TYPE, PHOTO, LOGIN_IP, LOGIN_DATE, LOGIN_FLAG, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8', '7', '9', 'jn_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0008', '济南综合部', null, null, null, null, null, null, null, '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (ID, COMPANY_ID, OFFICE_ID, LOGIN_NAME, PASSWORD, NO, NAME, EMAIL, PHONE, MOBILE, USER_TYPE, PHOTO, LOGIN_IP, LOGIN_DATE, LOGIN_FLAG, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9', '7', '10', 'jn_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0009', '济南市场部', null, null, null, null, null, null, null, '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (ID, COMPANY_ID, OFFICE_ID, LOGIN_NAME, PASSWORD, NO, NAME, EMAIL, PHONE, MOBILE, USER_TYPE, PHOTO, LOGIN_IP, LOGIN_DATE, LOGIN_FLAG, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('10', '7', '11', 'jn_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0010', '济南技术部', null, null, null, null, null, null, null, '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (ID, COMPANY_ID, OFFICE_ID, LOGIN_NAME, PASSWORD, NO, NAME, EMAIL, PHONE, MOBILE, USER_TYPE, PHOTO, LOGIN_IP, LOGIN_DATE, LOGIN_FLAG, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('11', '12', '13', 'lc_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0011', '济南历城领导', null, null, null, null, null, null, null, '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (ID, COMPANY_ID, OFFICE_ID, LOGIN_NAME, PASSWORD, NO, NAME, EMAIL, PHONE, MOBILE, USER_TYPE, PHOTO, LOGIN_IP, LOGIN_DATE, LOGIN_FLAG, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('12', '12', '18', 'lx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0012', '济南历下领导', null, null, null, null, null, null, null, '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (ID, COMPANY_ID, OFFICE_ID, LOGIN_NAME, PASSWORD, NO, NAME, EMAIL, PHONE, MOBILE, USER_TYPE, PHOTO, LOGIN_IP, LOGIN_DATE, LOGIN_FLAG, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('13', '22', '23', 'gx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0013', '济南高新领导', null, null, null, null, null, null, null, '1', '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('27-05-2013 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 13 records loaded
prompt Loading SYS_USER_ROLE...
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('1', '1');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('1', '2');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('10', '2');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('11', '3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('12', '4');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('13', '5');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('14', '6');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('2', '1');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('3', '2');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('4', '3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('5', '4');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('6', '5');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('7', '2');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('7', '7');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('8', '2');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('9', '1');




commit;
prompt 16 records loaded
prompt Loading TEST_DATA...
prompt Table is empty
prompt Loading TEST_DATA_CHILD...
prompt Table is empty
prompt Loading TEST_DATA_MAIN...
prompt Table is empty
prompt Loading TEST_TREE...
prompt Table is empty
set feedback on
set define on
prompt Done.
