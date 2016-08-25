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
  is '��һ��ֻ�����п��������������˺ŵ��˺�Ҳһ��';
comment on column ORACLE1.CARDS.HOLDERNAME
  is '�����û���';
comment on column ORACLE1.CARDS.BANKNAME
  is '��������';
comment on column ORACLE1.CARDS.ACCOUNTNUMBER
  is '�˺�';
comment on column ORACLE1.CARDS.BALANCE
  is '���';
comment on column ORACLE1.CARDS.UPDATETIME
  is '����ʱ��';
comment on column ORACLE1.CARDS.LOCATION
  is '������֧������';
comment on column ORACLE1.CARDS.RESERVEFIELD1
  is 'Ԥ���ֶ�1';
comment on column ORACLE1.CARDS.RESERVEFIELD2
  is 'Ԥ���ֶ�2';
comment on column ORACLE1.CARDS.REMARK
  is '��ע';

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
  is '����';
comment on column ORACLE1.CASHFLOW.ITEM
  is '��Ŀ����';
comment on column ORACLE1.CASHFLOW.MONEY
  is '���';
comment on column ORACLE1.CASHFLOW.REMARK
  is '��ע';
comment on column ORACLE1.CASHFLOW.HOLDERNAME
  is '������';
comment on column ORACLE1.CASHFLOW.TYPE
  is '����֧�����ͱ�־������Ϊ0 ָ��Ϊ1';

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
  is '���';
comment on column ORACLE1.CODES.TYPE
  is '�������';
comment on column ORACLE1.CODES.CODE
  is '��';
comment on column ORACLE1.CODES.VALUE
  is 'ֵ';
comment on column ORACLE1.CODES.DESCRIPTION
  is '����';
comment on column ORACLE1.CODES.HOLDERNAME
  is '�����û���';
comment on column ORACLE1.CODES.ISALL
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
  is 'DATE��ʽ�����ڣ����������ɸѡ';
comment on column ORACLE1.ELSEDETAIL.COLUMNNAME
  is '��ע�������';
comment on column ORACLE1.ELSEDETAIL.VALUE
  is '��ע���ֵ';
comment on column ORACLE1.ELSEDETAIL.HOLDERNAME
  is '������';

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
  is '������';
comment on column ORACLE1.EXPENSE.PROFIT
  is 'ʣ��';
comment on column ORACLE1.EXPENSE.COST_DAILY
  is '����';
comment on column ORACLE1.EXPENSE.EATING
  is '�Է���ˮ��';
comment on column ORACLE1.EXPENSE.SUPERMARKET
  is '����';
comment on column ORACLE1.EXPENSE.PARTY
  is '�۲�';
comment on column ORACLE1.EXPENSE.RENT
  is '����';
comment on column ORACLE1.EXPENSE.TRAFFICEXP
  is '��ͨ';
comment on column ORACLE1.EXPENSE.ELSECOST
  is '����';
comment on column ORACLE1.EXPENSE.REMARK
  is '��ע';
comment on column ORACLE1.EXPENSE.CLOTHES
  is '���·�';
comment on column ORACLE1.EXPENSE.BOOK
  is '����';
comment on column ORACLE1.EXPENSE.HOLDERNAME
  is '��¼�����û���';
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
  is '�����û���';
comment on column ORACLE1.FUSER.USERNAME
  is '��¼��';
comment on column ORACLE1.FUSER.PASSWORD
  is '����';
comment on column ORACLE1.FUSER.ROLE
  is '��ɫ';
comment on column ORACLE1.FUSER.SHOWNAME
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
  is '�ʲ���ϸ��';
comment on column ORACLE1.PROPERTY.CARD1
  is '���п�1���';
comment on column ORACLE1.PROPERTY.CARD2
  is '���п�2���';
comment on column ORACLE1.PROPERTY.CARD3
  is '���п�3���';
comment on column ORACLE1.PROPERTY.CARD4
  is '���п�4���';
comment on column ORACLE1.PROPERTY.CARD5
  is '���п�5���';
comment on column ORACLE1.PROPERTY.CARD6
  is '���п�6���';
comment on column ORACLE1.PROPERTY.CARD7
  is '���п�7���';
comment on column ORACLE1.PROPERTY.CASH
  is '�ֽ�';
comment on column ORACLE1.PROPERTY.HOUSINGFUND
  is 'ס��������';
comment on column ORACLE1.PROPERTY.ALIPAY
  is '֧�����������ϻ��£�';
comment on column ORACLE1.PROPERTY.CREDITCARD
  is '���ÿ�';
comment on column ORACLE1.PROPERTY.RENT
  is '����Ѻ��͵渶';
comment on column ORACLE1.PROPERTY.LOAN1
  is '��Ƿ����';
comment on column ORACLE1.PROPERTY.LOAN2
  is '���˽���';
comment on column ORACLE1.PROPERTY.REMARK
  is '����';
comment on column ORACLE1.PROPERTY.HOLDERNAME
  is '��������';
comment on column ORACLE1.PROPERTY.TIMES
  is '���ʱ��';
comment on column ORACLE1.PROPERTY.TOTAL
  is '���ʲ�';
comment on column ORACLE1.PROPERTY.MORTGAGE
  is '����';

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
