#  数据库设计规范
--针对表
酒店管理系统

订单表

订单编号
房间号
联系人
联系人电话
身份证号

数据冗余，一个人定了多个房间

订单编号
房间号
联系人编号

联系人编号
联系人
联系人电话
身份证号


## 数据库设计三范式
### 第一范式
要求表的每一个字段（列名），都是独立的不可分割的最小单元
### 第二范式
要求表除了主键外的其他字段都必须和主键有依赖关系（一张表表达一个意思）
### 第三范式
要求表除了主键外的其他字段都只能由主键决定。数据不能存在传递关系。

学生表
学号
姓名
年龄
性别
所在院校
院校地址
院校电话

学号
姓名
年龄
性别
所在院校

所在院校
院校地址
院校电话