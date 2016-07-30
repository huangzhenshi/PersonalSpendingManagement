-- Create table
create table EXPENSE
(
  ID           NUMBER(5) not null,
  TIMES        VARCHAR2(20) not null,
  INCOME_TOTAL NUMBER(7),
  PROFIT       NUMBER(7),
  COST_DAILY   NUMBER(7),
  EATING       NUMBER(7),
  SUPERMARKET  NUMBER(7),
  PARTY        NUMBER(7),
  RENT         NUMBER(7),
  LOAN         NUMBER(7),
  TRAFFICEXP   NUMBER(7),
  ELSECOST     NUMBER(7),
  REMARK       VARCHAR2(200),
  CLOTHES      NUMBER(7),
  BOOK         NUMBER(7),
  HOLDERNAME   VARCHAR2(40)
);
-- Add comments to the columns 
comment on column EXPENSE.INCOME_TOTAL
  is '������';
comment on column EXPENSE.PROFIT
  is 'ʣ��';
comment on column EXPENSE.COST_DAILY
  is '����';
comment on column EXPENSE.EATING
  is '�Է���ˮ��';
comment on column EXPENSE.SUPERMARKET
  is '����';
comment on column EXPENSE.PARTY
  is '�۲�';
comment on column EXPENSE.RENT
  is '����';
comment on column EXPENSE.LOAN
  is '����';
comment on column EXPENSE.TRAFFICEXP
  is '��ͨ';
comment on column EXPENSE.ELSECOST
  is '����';
comment on column EXPENSE.REMARK
  is '��ע';
comment on column EXPENSE.CLOTHES
  is '���·�';
comment on column EXPENSE.BOOK
  is '����';
comment on column EXPENSE.HOLDERNAME
  is '��¼�����û���';



  -- Create table
create table FUSER
(
  ID       VARCHAR2(10) not null,
  USERNAME VARCHAR2(10),
  PASSWORD VARCHAR2(10),
  ROLE     VARCHAR2(20),
  SHOWNAME VARCHAR2(20)
);
-- Add comments to the table 
comment on table FUSER
  is '�����û���';
-- Add comments to the columns 
comment on column FUSER.USERNAME
  is '��¼��';
comment on column FUSER.PASSWORD
  is '����';
comment on column FUSER.ROLE
  is '��ɫ';
comment on column FUSER.SHOWNAME
  is '��ʾ��';
insert into expense (ID, TIMES, INCOME_TOTAL, PROFIT, COST_DAILY, EATING, SUPERMARKET, PARTY, RENT, LOAN, TRAFFICEXP, ELSECOST, REMARK, CLOTHES, BOOK, HOLDERNAME)
values (170, '2016-07-29', 5000, 1, 11, 1, 1, null, null, null, null, null, '', null, null, '');

insert into expense (ID, TIMES, INCOME_TOTAL, PROFIT, COST_DAILY, EATING, SUPERMARKET, PARTY, RENT, LOAN, TRAFFICEXP, ELSECOST, REMARK, CLOTHES, BOOK, HOLDERNAME)
values (2, '2016-07-22', 5000, 190, 140, 20, null, null, 70, 50, null, null, '', null, null, 'huang');

insert into expense (ID, TIMES, INCOME_TOTAL, PROFIT, COST_DAILY, EATING, SUPERMARKET, PARTY, RENT, LOAN, TRAFFICEXP, ELSECOST, REMARK, CLOTHES, BOOK, HOLDERNAME)
values (94, '2016-07-28 0616', 5000, 1, 11, 1, 1, 1, 11, 1, 1, 1, '1', 11, 1, '');

insert into expense (ID, TIMES, INCOME_TOTAL, PROFIT, COST_DAILY, EATING, SUPERMARKET, PARTY, RENT, LOAN, TRAFFICEXP, ELSECOST, REMARK, CLOTHES, BOOK, HOLDERNAME)
values (16, '2016-07-2216', 5000, 190, 140, 20, null, null, 70, 50, null, null, '', null, null, 'huang');

insert into expense (ID, TIMES, INCOME_TOTAL, PROFIT, COST_DAILY, EATING, SUPERMARKET, PARTY, RENT, LOAN, TRAFFICEXP, ELSECOST, REMARK, CLOTHES, BOOK, HOLDERNAME)
values (130, '2016-07-28 0740', 5000, null, null, null, null, null, null, null, null, null, '', null, null, '');

insert into expense (ID, TIMES, INCOME_TOTAL, PROFIT, COST_DAILY, EATING, SUPERMARKET, PARTY, RENT, LOAN, TRAFFICEXP, ELSECOST, REMARK, CLOTHES, BOOK, HOLDERNAME)
values (20, '2016-07-221620', 5000, 190, 140, 20, null, null, 70, 50, null, null, '', null, null, 'huang');

insert into expense (ID, TIMES, INCOME_TOTAL, PROFIT, COST_DAILY, EATING, SUPERMARKET, PARTY, RENT, LOAN, TRAFFICEXP, ELSECOST, REMARK, CLOTHES, BOOK, HOLDERNAME)
values (22, '2016-07-2222', 5000, 190, 140, 20, null, null, 70, 50, null, null, '', null, null, 'huang');

insert into expense (ID, TIMES, INCOME_TOTAL, PROFIT, COST_DAILY, EATING, SUPERMARKET, PARTY, RENT, LOAN, TRAFFICEXP, ELSECOST, REMARK, CLOTHES, BOOK, HOLDERNAME)
values (24, '2016-07-221624', 5000, 190, 140, 20, null, null, 70, 50, null, null, '', null, null, 'huang');

insert into expense (ID, TIMES, INCOME_TOTAL, PROFIT, COST_DAILY, EATING, SUPERMARKET, PARTY, RENT, LOAN, TRAFFICEXP, ELSECOST, REMARK, CLOTHES, BOOK, HOLDERNAME)
values (28, '2016-07-22162028', 5000, 190, 140, 20, null, null, 70, 50, null, null, '', null, null, 'huang');

insert into expense (ID, TIMES, INCOME_TOTAL, PROFIT, COST_DAILY, EATING, SUPERMARKET, PARTY, RENT, LOAN, TRAFFICEXP, ELSECOST, REMARK, CLOTHES, BOOK, HOLDERNAME)
values (34, '2016-07-221834', 5000, 190, 140, 20, null, null, 70, 50, null, null, '', null, null, 'huang');

insert into expense (ID, TIMES, INCOME_TOTAL, PROFIT, COST_DAILY, EATING, SUPERMARKET, PARTY, RENT, LOAN, TRAFFICEXP, ELSECOST, REMARK, CLOTHES, BOOK, HOLDERNAME)
values (40, '2016-07-22162440', 5000, 190, 140, 20, null, null, 70, 50, null, null, '', null, null, 'huang');

insert into expense (ID, TIMES, INCOME_TOTAL, PROFIT, COST_DAILY, EATING, SUPERMARKET, PARTY, RENT, LOAN, TRAFFICEXP, ELSECOST, REMARK, CLOTHES, BOOK, HOLDERNAME)
values (50, '2016-07-221850', 5000, 190, 140, 20, null, null, 70, 50, null, null, '', null, null, 'huang');

insert into expense (ID, TIMES, INCOME_TOTAL, PROFIT, COST_DAILY, EATING, SUPERMARKET, PARTY, RENT, LOAN, TRAFFICEXP, ELSECOST, REMARK, CLOTHES, BOOK, HOLDERNAME)
values (52, '2016-07-22162052', 5000, 190, 140, 20, null, null, 70, 50, null, null, '', null, null, 'huang');

insert into expense (ID, TIMES, INCOME_TOTAL, PROFIT, COST_DAILY, EATING, SUPERMARKET, PARTY, RENT, LOAN, TRAFFICEXP, ELSECOST, REMARK, CLOTHES, BOOK, HOLDERNAME)
values (54, '2016-07-222254', 5000, 190, 140, 20, null, null, 70, 50, null, null, '', null, null, 'huang');

insert into expense (ID, TIMES, INCOME_TOTAL, PROFIT, COST_DAILY, EATING, SUPERMARKET, PARTY, RENT, LOAN, TRAFFICEXP, ELSECOST, REMARK, CLOTHES, BOOK, HOLDERNAME)
values (58, '2016-07-22182658', 5000, 190, 140, 20, null, null, 70, 50, null, null, '', null, null, 'huang');

insert into expense (ID, TIMES, INCOME_TOTAL, PROFIT, COST_DAILY, EATING, SUPERMARKET, PARTY, RENT, LOAN, TRAFFICEXP, ELSECOST, REMARK, CLOTHES, BOOK, HOLDERNAME)
values (60, '2016-07-2216202860', 5000, 190, 140, 20, null, null, 70, 50, null, null, '', null, null, 'huang');

insert into expense (ID, TIMES, INCOME_TOTAL, PROFIT, COST_DAILY, EATING, SUPERMARKET, PARTY, RENT, LOAN, TRAFFICEXP, ELSECOST, REMARK, CLOTHES, BOOK, HOLDERNAME)
values (62, '2016-07-223062', 5000, 190, 140, 20, null, null, 70, 50, null, null, '', null, null, 'huang');


insert into fuser (ID, USERNAME, PASSWORD, ROLE, SHOWNAME)
values ('1', 'huang', '000000', '0', '����');

insert into fuser (ID, USERNAME, PASSWORD, ROLE, SHOWNAME)
values ('2', 'admin', '000000', '1', '��ʴ��');

