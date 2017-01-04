-----------------------------------------------
-- Export file for user ORACLE1              --
-- Created by huzh6001 on 2017/1/4, 18:30:52 --
-----------------------------------------------

set define off
spool 123.log

prompt
prompt Creating table ARTICLE
prompt ======================
prompt
create table ORACLE1.ARTICLE
(
  id         NUMBER not null,
  title      VARCHAR2(150) not null,
  content    CLOB not null,
  tag_time   VARCHAR2(30) not null,
  last_time  VARCHAR2(30) not null,
  holdername VARCHAR2(30) not null,
  type       NUMBER not null
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
alter table ORACLE1.ARTICLE
  add constraint DIARY_ID_PK primary key (ID)
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
prompt Creating table CARDS
prompt ====================
prompt
create table ORACLE1.CARDS
(
  id            NUMBER(5),
  holdername    VARCHAR2(50),
  bankname      VARCHAR2(50),
  accountnumber VARCHAR2(50),
  balance       NUMBER(7),
  updatetime    VARCHAR2(20),
  location      VARCHAR2(50),
  reservefield1 VARCHAR2(300),
  reservefield2 VARCHAR2(300),
  remark        VARCHAR2(300),
  password      VARCHAR2(20)
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
comment on column ORACLE1.CARDS.holdername
  is '归属用户名';
comment on column ORACLE1.CARDS.bankname
  is '银行名称';
comment on column ORACLE1.CARDS.accountnumber
  is '账号';
comment on column ORACLE1.CARDS.balance
  is '余额';
comment on column ORACLE1.CARDS.updatetime
  is '更新时间';
comment on column ORACLE1.CARDS.location
  is '开户行支行名称';
comment on column ORACLE1.CARDS.reservefield1
  is '预留字段1';
comment on column ORACLE1.CARDS.reservefield2
  is '预留字段2';
comment on column ORACLE1.CARDS.remark
  is '备注';

prompt
prompt Creating table CASHFLOW
prompt =======================
prompt
create table ORACLE1.CASHFLOW
(
  id         NUMBER,
  times      DATE,
  item       VARCHAR2(50),
  money      NUMBER(7),
  remark     VARCHAR2(500),
  holdername VARCHAR2(50),
  type       NUMBER(2)
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
comment on column ORACLE1.CASHFLOW.times
  is '日期';
comment on column ORACLE1.CASHFLOW.item
  is '条目名称';
comment on column ORACLE1.CASHFLOW.money
  is '金额';
comment on column ORACLE1.CASHFLOW.remark
  is '备注';
comment on column ORACLE1.CASHFLOW.holdername
  is '所有者';
comment on column ORACLE1.CASHFLOW.type
  is '收入支出类型标志，收入为0 指出为1';

prompt
prompt Creating table CODES
prompt ====================
prompt
create table ORACLE1.CODES
(
  id          NUMBER not null,
  type        VARCHAR2(50),
  code        VARCHAR2(50),
  value       VARCHAR2(50),
  description VARCHAR2(1000),
  holdername  VARCHAR2(50),
  isall       NUMBER(2) default 1
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
comment on column ORACLE1.CODES.type
  is '码表类型';
comment on column ORACLE1.CODES.code
  is '码';
comment on column ORACLE1.CODES.value
  is '值';
comment on column ORACLE1.CODES.description
  is '描述';
comment on column ORACLE1.CODES.holdername
  is '所属用户名';
comment on column ORACLE1.CODES.isall
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
  id         NUMBER not null,
  times      DATE,
  columnname VARCHAR2(50),
  value      NUMBER(7),
  holdername VARCHAR2(100)
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
comment on column ORACLE1.ELSEDETAIL.times
  is 'DATE格式的日期，方便后期做筛选';
comment on column ORACLE1.ELSEDETAIL.columnname
  is '备注项的名称';
comment on column ORACLE1.ELSEDETAIL.value
  is '备注项的值';
comment on column ORACLE1.ELSEDETAIL.holdername
  is '所有者';

prompt
prompt Creating table EXPENSE
prompt ======================
prompt
create table ORACLE1.EXPENSE
(
  id           NUMBER(5) not null,
  times        DATE,
  income_total NUMBER(7),
  profit       NUMBER(7),
  cost_daily   NUMBER(7),
  eating       NUMBER(7),
  supermarket  NUMBER(7),
  party        NUMBER(7),
  rent         NUMBER(7),
  trafficexp   NUMBER(7),
  elsecost     NUMBER(7),
  remark       VARCHAR2(200),
  clothes      NUMBER(7),
  book         NUMBER(7),
  holdername   VARCHAR2(40)
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
comment on column ORACLE1.EXPENSE.income_total
  is '日收入';
comment on column ORACLE1.EXPENSE.profit
  is '剩余';
comment on column ORACLE1.EXPENSE.cost_daily
  is '开销';
comment on column ORACLE1.EXPENSE.eating
  is '吃饭和水果';
comment on column ORACLE1.EXPENSE.supermarket
  is '超市';
comment on column ORACLE1.EXPENSE.party
  is '聚餐';
comment on column ORACLE1.EXPENSE.rent
  is '房租';
comment on column ORACLE1.EXPENSE.trafficexp
  is '交通';
comment on column ORACLE1.EXPENSE.elsecost
  is '其他';
comment on column ORACLE1.EXPENSE.remark
  is '备注';
comment on column ORACLE1.EXPENSE.clothes
  is '买衣服';
comment on column ORACLE1.EXPENSE.book
  is '买书';
comment on column ORACLE1.EXPENSE.holdername
  is '记录所属用户名';
alter table ORACLE1.EXPENSE
  add constraint PK_EXPENSE_ID primary key (ID)
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
alter table ORACLE1.EXPENSE
  add constraint UK_EXPENSE_TIMES_HOLDERNAME unique (TIMES, HOLDERNAME)
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
  id       VARCHAR2(10) not null,
  username VARCHAR2(10),
  password VARCHAR2(10),
  role     VARCHAR2(20),
  showname VARCHAR2(20)
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
comment on column ORACLE1.FUSER.username
  is '登录名';
comment on column ORACLE1.FUSER.password
  is '密码';
comment on column ORACLE1.FUSER.role
  is '角色';
comment on column ORACLE1.FUSER.showname
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
prompt Creating table HABITS
prompt =====================
prompt
create table ORACLE1.HABITS
(
  id         NUMBER not null,
  holdername VARCHAR2(50),
  times      DATE,
  habit1     VARCHAR2(100),
  habit2     VARCHAR2(100),
  habit3     VARCHAR2(100),
  habit4     VARCHAR2(100),
  habit5     VARCHAR2(100),
  habit6     VARCHAR2(100),
  habit7     VARCHAR2(100),
  remark     VARCHAR2(400)
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
alter table ORACLE1.HABITS
  add constraint PK_HABITS_ID primary key (ID)
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
  id          NUMBER,
  card1       NUMBER(7),
  card2       NUMBER(7),
  card3       NUMBER(7),
  card4       NUMBER(7),
  card5       NUMBER(7),
  card6       NUMBER(7),
  card7       NUMBER(7),
  cash        NUMBER(7),
  housingfund NUMBER(7),
  alipay      NUMBER(7),
  creditcard  NUMBER(7),
  rent        NUMBER(7),
  loan1       NUMBER(7),
  loan2       NUMBER(7),
  remark      VARCHAR2(1000),
  holdername  VARCHAR2(100),
  times       VARCHAR2(50),
  total       NUMBER(7),
  mortgage    NUMBER(7)
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
comment on column ORACLE1.PROPERTY.card1
  is '银行卡1余额';
comment on column ORACLE1.PROPERTY.card2
  is '银行卡2余额';
comment on column ORACLE1.PROPERTY.card3
  is '银行卡3余额';
comment on column ORACLE1.PROPERTY.card4
  is '银行卡4余额';
comment on column ORACLE1.PROPERTY.card5
  is '银行卡5余额';
comment on column ORACLE1.PROPERTY.card6
  is '银行卡6余额';
comment on column ORACLE1.PROPERTY.card7
  is '银行卡7余额';
comment on column ORACLE1.PROPERTY.cash
  is '现金';
comment on column ORACLE1.PROPERTY.housingfund
  is '住房公积金';
comment on column ORACLE1.PROPERTY.alipay
  is '支付宝（含蚂蚁花呗）';
comment on column ORACLE1.PROPERTY.creditcard
  is '信用卡';
comment on column ORACLE1.PROPERTY.rent
  is '房租押金和垫付';
comment on column ORACLE1.PROPERTY.loan1
  is '我欠别人';
comment on column ORACLE1.PROPERTY.loan2
  is '别人借我';
comment on column ORACLE1.PROPERTY.remark
  is '描述';
comment on column ORACLE1.PROPERTY.holdername
  is '所属对象';
comment on column ORACLE1.PROPERTY.times
  is '标记时间';
comment on column ORACLE1.PROPERTY.total
  is '总资产';
comment on column ORACLE1.PROPERTY.mortgage
  is '贷款';

prompt
prompt Creating table SLEEP
prompt ====================
prompt
create table ORACLE1.SLEEP
(
  id         VARCHAR2(20) not null,
  times      VARCHAR2(20) not null,
  get_up     VARCHAR2(20),
  get_sleep  VARCHAR2(20),
  remark     VARCHAR2(500),
  holdername VARCHAR2(50) not null
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
alter table ORACLE1.SLEEP
  add constraint SLEEP_PK_ID primary key (ID)
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
alter table ORACLE1.SLEEP
  add constraint SLEEP_UK_TIMES unique (TIMES)
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
prompt Creating sequence SEQ_ARTICLE_ID
prompt ================================
prompt
create sequence ORACLE1.SEQ_ARTICLE_ID
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
start with 121
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CODES_ID
prompt ==============================
prompt
create sequence ORACLE1.SEQ_CODES_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 320
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DIARY_ID
prompt ==============================
prompt
create sequence ORACLE1.SEQ_DIARY_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 61
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ELSEDETAIL_ID
prompt ===================================
prompt
create sequence ORACLE1.SEQ_ELSEDETAIL_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 660
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_EXPENSE_ID
prompt ================================
prompt
create sequence ORACLE1.SEQ_EXPENSE_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 3130
increment by 2
cache 20;

prompt
prompt Creating sequence SEQ_FLOW_ID
prompt =============================
prompt
create sequence ORACLE1.SEQ_FLOW_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 341
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_HABITS_ID
prompt ===============================
prompt
create sequence ORACLE1.SEQ_HABITS_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PROPERTY_ID
prompt =================================
prompt
create sequence ORACLE1.SEQ_PROPERTY_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 201
increment by 1
cache 20;

prompt
prompt Creating sequence SLEEP_ID_SEQ
prompt ==============================
prompt
create sequence ORACLE1.SLEEP_ID_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 41
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
