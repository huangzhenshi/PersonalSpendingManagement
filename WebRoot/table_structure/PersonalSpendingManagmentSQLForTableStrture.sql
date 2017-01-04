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
  is '��һ��ֻ�����п��������������˺ŵ��˺�Ҳһ��';
comment on column ORACLE1.CARDS.holdername
  is '�����û���';
comment on column ORACLE1.CARDS.bankname
  is '��������';
comment on column ORACLE1.CARDS.accountnumber
  is '�˺�';
comment on column ORACLE1.CARDS.balance
  is '���';
comment on column ORACLE1.CARDS.updatetime
  is '����ʱ��';
comment on column ORACLE1.CARDS.location
  is '������֧������';
comment on column ORACLE1.CARDS.reservefield1
  is 'Ԥ���ֶ�1';
comment on column ORACLE1.CARDS.reservefield2
  is 'Ԥ���ֶ�2';
comment on column ORACLE1.CARDS.remark
  is '��ע';

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
  is '����';
comment on column ORACLE1.CASHFLOW.item
  is '��Ŀ����';
comment on column ORACLE1.CASHFLOW.money
  is '���';
comment on column ORACLE1.CASHFLOW.remark
  is '��ע';
comment on column ORACLE1.CASHFLOW.holdername
  is '������';
comment on column ORACLE1.CASHFLOW.type
  is '����֧�����ͱ�־������Ϊ0 ָ��Ϊ1';

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
  is '���';
comment on column ORACLE1.CODES.type
  is '�������';
comment on column ORACLE1.CODES.code
  is '��';
comment on column ORACLE1.CODES.value
  is 'ֵ';
comment on column ORACLE1.CODES.description
  is '����';
comment on column ORACLE1.CODES.holdername
  is '�����û���';
comment on column ORACLE1.CODES.isall
  is '0Ϊͨ����ֵ��1Ϊר����ֵ';
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
  is 'DATE��ʽ�����ڣ����������ɸѡ';
comment on column ORACLE1.ELSEDETAIL.columnname
  is '��ע�������';
comment on column ORACLE1.ELSEDETAIL.value
  is '��ע���ֵ';
comment on column ORACLE1.ELSEDETAIL.holdername
  is '������';

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
  is '������';
comment on column ORACLE1.EXPENSE.profit
  is 'ʣ��';
comment on column ORACLE1.EXPENSE.cost_daily
  is '����';
comment on column ORACLE1.EXPENSE.eating
  is '�Է���ˮ��';
comment on column ORACLE1.EXPENSE.supermarket
  is '����';
comment on column ORACLE1.EXPENSE.party
  is '�۲�';
comment on column ORACLE1.EXPENSE.rent
  is '����';
comment on column ORACLE1.EXPENSE.trafficexp
  is '��ͨ';
comment on column ORACLE1.EXPENSE.elsecost
  is '����';
comment on column ORACLE1.EXPENSE.remark
  is '��ע';
comment on column ORACLE1.EXPENSE.clothes
  is '���·�';
comment on column ORACLE1.EXPENSE.book
  is '����';
comment on column ORACLE1.EXPENSE.holdername
  is '��¼�����û���';
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
  is '�����û���';
comment on column ORACLE1.FUSER.username
  is '��¼��';
comment on column ORACLE1.FUSER.password
  is '����';
comment on column ORACLE1.FUSER.role
  is '��ɫ';
comment on column ORACLE1.FUSER.showname
  is '��ʾ��';
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
  is '�ʲ���ϸ��';
comment on column ORACLE1.PROPERTY.card1
  is '���п�1���';
comment on column ORACLE1.PROPERTY.card2
  is '���п�2���';
comment on column ORACLE1.PROPERTY.card3
  is '���п�3���';
comment on column ORACLE1.PROPERTY.card4
  is '���п�4���';
comment on column ORACLE1.PROPERTY.card5
  is '���п�5���';
comment on column ORACLE1.PROPERTY.card6
  is '���п�6���';
comment on column ORACLE1.PROPERTY.card7
  is '���п�7���';
comment on column ORACLE1.PROPERTY.cash
  is '�ֽ�';
comment on column ORACLE1.PROPERTY.housingfund
  is 'ס��������';
comment on column ORACLE1.PROPERTY.alipay
  is '֧�����������ϻ��£�';
comment on column ORACLE1.PROPERTY.creditcard
  is '���ÿ�';
comment on column ORACLE1.PROPERTY.rent
  is '����Ѻ��͵渶';
comment on column ORACLE1.PROPERTY.loan1
  is '��Ƿ����';
comment on column ORACLE1.PROPERTY.loan2
  is '���˽���';
comment on column ORACLE1.PROPERTY.remark
  is '����';
comment on column ORACLE1.PROPERTY.holdername
  is '��������';
comment on column ORACLE1.PROPERTY.times
  is '���ʱ��';
comment on column ORACLE1.PROPERTY.total
  is '���ʲ�';
comment on column ORACLE1.PROPERTY.mortgage
  is '����';

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
