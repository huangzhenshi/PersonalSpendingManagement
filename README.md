# PersonalSpendingManagement
一个非常入门级但非常实用的web程序

功能：个人的记账管理软件

已经实现的功能：登录（huang/000000）、记账的增删改查功能、历史账单回顾

后台框架：Spring mvc mybatis


前台框架：jquery、bootstrap、Coral

数据库：oracle、mysql（在/WebRoot/oracleFile_dmp/ 下 有 oracle的dmp文件，也有基本表 基本数据的sql文件）

技术上：框架和基本功能都初步实现（log4j后台打印sql、spring的 注解事务控制），能实现增删改查功能和指定月份或者日期之间的查询功能。



2016/8/5 



1）excel的导入和导出功能

2）图表展示 画趋势图

3）资产管理、银行卡管理、记账遗漏提醒、智能财务分析、码表配置等功能



后期考虑改造成 hibernate 做record这个功能，可以简化太多太多，而且既然定位是个人应用，而且表表关联不紧密的话，支持多数据库，更适合hibernate

分页功能，和特定条数查询 要补充起来

bootstrap深究一下，input框的 日期增加都没有required=true设置

新增和修改功能要做成dialog，而不是刷界面

配置成maven管理的形式，方便复用

后期再考虑扩展多用户管理功能


大后期考虑做的功能：

1）日记功能，考虑引入CKEditor

2）健身记录功能
