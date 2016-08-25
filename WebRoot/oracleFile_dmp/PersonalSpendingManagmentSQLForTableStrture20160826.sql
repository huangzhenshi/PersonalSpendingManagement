--------------------------------------------
-- Export file for user ORACLE1           --
-- Created by huang on 2016/8/26, 7:01:42 --
--------------------------------------------

spool PersonalSpendingManagmentSQLForTableStrture20160826.log

prompt
prompt Creating table CARDS
prompt ====================
prompt
create table ORACLE1.CARDS
(
  ID            NUMBER(5),
  HOLDERNAME    VARCHAR2(50),
  BANKNAME      VARCHAR2(50),
  ACCOUNTNUMBER VARCHAR2(50),
  BALANCE       NUMBER(7),
  UPDATETIME    VARCHAR2(20),
  LOCATION      VARCHAR2(50),
  RESERVEFIELD1 VARCHAR2(300),
  RESERVEFIELD2 VARCHAR2(300),
  REMARK        VARCHAR2(300),
  PASSWORD      VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table ORACLE1.CARDS
  is '不一定只是银行卡，其他公积金账号等账号也一样';
comment on column ORACLE1.CARDS.HOLDERNAME
  is '归属用户名';
comment on column ORACLE1.CARDS.BANKNAME
  is '银行名称';
comment on column ORACLE1.CARDS.ACCOUNTNUMBER
  is '账号';
comment on column ORACLE1.CARDS.BALANCE
  is '余额';
comment on column ORACLE1.CARDS.UPDATETIME
  is '更新时间';
comment on column ORACLE1.CARDS.LOCATION
  is '开户行支行名称';
comment on column ORACLE1.CARDS.RESERVEFIELD1
  is '预留字段1';
comment on column ORACLE1.CARDS.RESERVEFIELD2
  is '预留字段2';
comment on column ORACLE1.CARDS.REMARK
  is '备注';

prompt
prompt Creating table CASHFLOW
prompt =======================
prompt
create table ORACLE1.CASHFLOW
(
  ID         NUMBER,
  TIMES      DATE,
  ITEM       VARCHAR2(50),
  MONEY      NUMBER(7),
  REMARK     VARCHAR2(500),
  HOLDERNAME VARCHAR2(50),
  TYPE       NUMBER(2)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column ORACLE1.CASHFLOW.TIMES
  is '日期';
comment on column ORACLE1.CASHFLOW.ITEM
  is '条目名称';
comment on column ORACLE1.CASHFLOW.MONEY
  is '金额';
comment on column ORACLE1.CASHFLOW.REMARK
  is '备注';
comment on column ORACLE1.CASHFLOW.HOLDERNAME
  is '所有者';
comment on column ORACLE1.CASHFLOW.TYPE
  is '收入支出类型标志，收入为0 指出为1';

prompt
prompt Creating table CODES
prompt ====================
prompt
create table ORACLE1.CODES
(
  ID          NUMBER not null,
  TYPE        VARCHAR2(50),
  CODE        VARCHAR2(50),
  VALUE       VARCHAR2(50),
  DESCRIPTION VARCHAR2(1000),
  HOLDERNAME  VARCHAR2(50),
  ISALL       NUMBER(2) default 1
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table ORACLE1.CODES
  is '码表';
comment on column ORACLE1.CODES.TYPE
  is '码表类型';
comment on column ORACLE1.CODES.CODE
  is '码';
comment on column ORACLE1.CODES.VALUE
  is '值';
comment on column ORACLE1.CODES.DESCRIPTION
  is '描述';
comment on column ORACLE1.CODES.HOLDERNAME
  is '所属用户名';
comment on column ORACLE1.CODES.ISALL
  is '0为通用码值，1为专有码值';
alter table ORACLE1.CODES
  add constraint PK_CODEVALUECONFIG_ID primary key (ID)
  using index 
  tablespace USERS
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
prompt Creating table ELSEDETAIL
prompt =========================
prompt
create table ORACLE1.ELSEDETAIL
(
  ID         NUMBER not null,
  TIMES      DATE,
  COLUMNNAME VARCHAR2(50),
  VALUE      NUMBER(7),
  HOLDERNAME VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column ORACLE1.ELSEDETAIL.TIMES
  is 'DATE格式的日期，方便后期做筛选';
comment on column ORACLE1.ELSEDETAIL.COLUMNNAME
  is '备注项的名称';
comment on column ORACLE1.ELSEDETAIL.VALUE
  is '备注项的值';
comment on column ORACLE1.ELSEDETAIL.HOLDERNAME
  is '所有者';

prompt
prompt Creating table EXPENSE
prompt ======================
prompt
create table ORACLE1.EXPENSE
(
  ID           NUMBER(5) not null,
  TIMES        DATE not null,
  INCOME_TOTAL NUMBER(7),
  PROFIT       NUMBER(7),
  COST_DAILY   NUMBER(7),
  EATING       NUMBER(7),
  SUPERMARKET  NUMBER(7),
  PARTY        NUMBER(7),
  RENT         NUMBER(7),
  TRAFFICEXP   NUMBER(7),
  ELSECOST     NUMBER(7),
  REMARK       VARCHAR2(200),
  CLOTHES      NUMBER(7),
  BOOK         NUMBER(7),
  HOLDERNAME   VARCHAR2(40)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column ORACLE1.EXPENSE.INCOME_TOTAL
  is '日收入';
comment on column ORACLE1.EXPENSE.PROFIT
  is '剩余';
comment on column ORACLE1.EXPENSE.COST_DAILY
  is '开销';
comment on column ORACLE1.EXPENSE.EATING
  is '吃饭和水果';
comment on column ORACLE1.EXPENSE.SUPERMARKET
  is '超市';
comment on column ORACLE1.EXPENSE.PARTY
  is '聚餐';
comment on column ORACLE1.EXPENSE.RENT
  is '房租';
comment on column ORACLE1.EXPENSE.TRAFFICEXP
  is '交通';
comment on column ORACLE1.EXPENSE.ELSECOST
  is '其他';
comment on column ORACLE1.EXPENSE.REMARK
  is '备注';
comment on column ORACLE1.EXPENSE.CLOTHES
  is '买衣服';
comment on column ORACLE1.EXPENSE.BOOK
  is '买书';
comment on column ORACLE1.EXPENSE.HOLDERNAME
  is '记录所属用户名';
alter table ORACLE1.EXPENSE
  add constraint EXPENSE_DATA_PK primary key (TIMES, ID)
  using index 
  tablespace USERS
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
prompt Creating table FUSER
prompt ====================
prompt
create table ORACLE1.FUSER
(
  ID       VARCHAR2(10) not null,
  USERNAME VARCHAR2(10),
  PASSWORD VARCHAR2(10),
  ROLE     VARCHAR2(20),
  SHOWNAME VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table ORACLE1.FUSER
  is '财务用户表';
comment on column ORACLE1.FUSER.USERNAME
  is '登录名';
comment on column ORACLE1.FUSER.PASSWORD
  is '密码';
comment on column ORACLE1.FUSER.ROLE
  is '角色';
comment on column ORACLE1.FUSER.SHOWNAME
  is '显示名';
alter table ORACLE1.FUSER
  add constraint PK_ID primary key (ID)
  using index 
  tablespace USERS
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
prompt Creating table PROPERTY
prompt =======================
prompt
create table ORACLE1.PROPERTY
(
  ID          NUMBER,
  CARD1       NUMBER(7),
  CARD2       NUMBER(7),
  CARD3       NUMBER(7),
  CARD4       NUMBER(7),
  CARD5       NUMBER(7),
  CARD6       NUMBER(7),
  CARD7       NUMBER(7),
  CASH        NUMBER(7),
  HOUSINGFUND NUMBER(7),
  ALIPAY      NUMBER(7),
  CREDITCARD  NUMBER(7),
  RENT        NUMBER(7),
  LOAN1       NUMBER(7),
  LOAN2       NUMBER(7),
  REMARK      VARCHAR2(1000),
  HOLDERNAME  VARCHAR2(100),
  TIMES       VARCHAR2(50),
  TOTAL       NUMBER(7),
  MORTGAGE    NUMBER(7)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table ORACLE1.PROPERTY
  is '资产明细表';
comment on column ORACLE1.PROPERTY.CARD1
  is '银行卡1余额';
comment on column ORACLE1.PROPERTY.CARD2
  is '银行卡2余额';
comment on column ORACLE1.PROPERTY.CARD3
  is '银行卡3余额';
comment on column ORACLE1.PROPERTY.CARD4
  is '银行卡4余额';
comment on column ORACLE1.PROPERTY.CARD5
  is '银行卡5余额';
comment on column ORACLE1.PROPERTY.CARD6
  is '银行卡6余额';
comment on column ORACLE1.PROPERTY.CARD7
  is '银行卡7余额';
comment on column ORACLE1.PROPERTY.CASH
  is '现金';
comment on column ORACLE1.PROPERTY.HOUSINGFUND
  is '住房公积金';
comment on column ORACLE1.PROPERTY.ALIPAY
  is '支付宝（含蚂蚁花呗）';
comment on column ORACLE1.PROPERTY.CREDITCARD
  is '信用卡';
comment on column ORACLE1.PROPERTY.RENT
  is '房租押金和垫付';
comment on column ORACLE1.PROPERTY.LOAN1
  is '我欠别人';
comment on column ORACLE1.PROPERTY.LOAN2
  is '别人借我';
comment on column ORACLE1.PROPERTY.REMARK
  is '描述';
comment on column ORACLE1.PROPERTY.HOLDERNAME
  is '所属对象';
comment on column ORACLE1.PROPERTY.TIMES
  is '标记时间';
comment on column ORACLE1.PROPERTY.TOTAL
  is '总资产';
comment on column ORACLE1.PROPERTY.MORTGAGE
  is '贷款';

prompt
prompt Creating sequence FUSER_SEQ_ID
prompt ==============================
prompt
create sequence ORACLE1.FUSER_SEQ_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ADMIN_ID
prompt ==============================
prompt
create sequence ORACLE1.SEQ_ADMIN_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CARDS_ID
prompt ==============================
prompt
create sequence ORACLE1.SEQ_CARDS_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 61
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CODES_ID
prompt ==============================
prompt
create sequence ORACLE1.SEQ_CODES_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 200
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ELSEDETAIL_ID
prompt ===================================
prompt
create sequence ORACLE1.SEQ_ELSEDETAIL_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 260
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_EXPENSE_ID
prompt ================================
prompt
create sequence ORACLE1.SEQ_EXPENSE_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 1530
increment by 2
cache 20;

prompt
prompt Creating sequence SEQ_FLOW_ID
prompt =============================
prompt
create sequence ORACLE1.SEQ_FLOW_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 141
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PROPERTY_ID
prompt =================================
prompt
create sequence ORACLE1.SEQ_PROPERTY_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 101
increment by 1
cache 20;

prompt
prompt Creating procedure GETRECORD_P
prompt ==============================
prompt
CREATE OR REPLACE PROCEDURE ORACLE1.getrecord_p(holder IN VARCHAR2,
                                      qssj    IN VARCHAR2,
                                      jssj  IN VARCHAR2) IS
  P_count          NUMBER;
  p_index NUMBER;

BEGIN

  SELECT round(to_number(to_Date(jssj,'yyyy-mm-dd')-to_Date(qssj,'yyyy-mm-dd'))) INTO p_count FROM dual;

   p_index:=0;
WHILE p_index<=p_count LOOP

  INSERT INTO expense
    (ID,
     times,
     holdername,
     income_total,
     profit,
     cost_daily,
     eating,
     supermarket,
     party)
    SELECT seq_expense_id.nextval,to_date(qssj,'yyyy-mm-dd')+p_index,holder,1000,500,500,300,100,100 FROM dual;
     p_index:=p_index+1;
     END LOOP;

  COMMIT;
END getrecord_p;
/


spool off
