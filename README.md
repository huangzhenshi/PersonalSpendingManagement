# PersonalSpendingManagement
一个非常入门级的web程序

功能：个人的记账管理软件

已经实现的功能：登录（huang/000000）、记账的增删改查功能

后台框架：Spring struts2 mybatis


前台框架：jquery、bootstrap、Coral、

数据库：oracle（在/WebRoot/oracleFile_dmp/ 下 有 oracle的dmp文件，也有基本表 基本数据的sql文件）

技术上：框架和基本功能都初步实现（log4j后台打印sql、spring的 注解事务控制），能实现增删改查功能。


要改进的地方：

急需要做的功能：

1）缺少一个高大上的导航栏，预计后期要加入的功能模块（个人健身计划、日记功能CKEditor等等）

2）优化一下界面，特别是新增和修改界面，至少想办法居中吧

3）把统计功能给做出来，然后急需要支持 excel导入和导出功能 



后期考虑改造成 hibernate 做record这个功能，可以简化太多太多，而且既然定位是个人应用，而且表表关联不紧密的话，支持多数据库，更适合hibernate

分页功能，和特定条数查询 要补充起来

bootstrap深究一下，input框的 日期增加都没有required=true设置

新增和修改功能要做成dialog，而不是刷界面

配置成maven管理的形式，方便复用

后期再考虑扩展多用户管理功能


大后期考虑做的功能：

1）日记功能，考虑引入CKEditor

2）健身记录功能
