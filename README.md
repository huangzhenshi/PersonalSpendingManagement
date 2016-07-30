# PersonalSpendingManagement
一个非常入门级的web程序

功能：个人的记账管理软件

已经实现的功能：登录（huang/000000）、记账的增删改查功能

后台框架：Spring struts2 mybatis


前台框架：jquery、bootstrap、Coral、

数据库：oracle（在/WebRoot/oracleFile_dmp/ 下 有 oracle的dmp文件，也有基本表 基本数据的sql文件）

技术上：框架和基本功能都初步实现（log4j后台打印sql、spring的 注解事务控制），能实现增删改查功能。


要改进的地方：

1）grid 要换掉，要通过url ajax动态取值，而不是刷新页面取值,考虑直接引入jqGrid（！！！！！）

2）缺少一个高大上的导航栏，预计后期要加入的功能模块（个人健身计划、日记功能CKEditor等等）

3）首页当然要改，需要ps 搞点图片来，不能再用以前公司的log了

4)业务上：添加统计功能（按月、按年统计功能）

5）支持excel导入和导出功能

6）后期考虑改造成 hibernate 做record这个功能，可以简化太多太多，而且既然定位是个人应用，而且表表关联不紧密的话，支持多数据库，更适合hibernate

7）分页功能，和特定条数查询 要补充起来

8）bootstrap深究一下，input框的 日期增加都没有required=true设置

9）新增和修改功能要做成dialog，而不是刷界面

10）配置成maven管理的形式，方便复用

11）后期再考虑扩展多用户管理功能
