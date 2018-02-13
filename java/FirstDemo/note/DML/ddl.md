# DDL 数据定义语句
数据操作语句--数据
>数据库的定义与数据操作语句的差别
> DDL操作的是数据库的对象，默认是直接提交。
> DML操作的书局哭的数据，需要进行提交或回滚的操作。


## 数据定义语句--对象（表、列、师徒、索引、序列）
### 表为例
#### 1.创建
```sql
create table tablename(
  col1 type,
  col2 type,
  col3 type,
  ...
  coln type
);

create table student(
  sno number(7,2),
  sname varchar2(16),
  birthday date
);



CREATE TABLE manager AS
SELECT * FROM emp WHERE 1=0;--创建和emp一样的表结构

CREATE TABLE manager1 AS
SELECT * FROM emp;--完全复制emp表结构和数据


```

在sql plus中使用
`desc tablename`--可省略
`describe tablename`
>NOTE:复制表时，`AS`不可以省略
##### type:
> - number default length's number(默认长度数据)
>    - numner(4)  --length=4
>   - number(7,2)   --小数点后两位，总共长度七位，即小数点前五位
<br>

##### varchar2  --可变长度字符串
>- varchar2(16)   --长度为16的文字字符串（oracle）,可以存16个数字或者字母，也可以存储8个汉字
> - 不足16，剩余位置不会补充任何内容
>


##### char()  --长度不可变字符串
> - char(16)   --长度为16的文字字符串（oracle）,可以存16个数字或者字母，也可以存储8个汉字
> - 不足16，剩余位置补充空格

Question:  char varchar2 varchar 三者的区别


##### date
>date  --日期型，精确到秒
> timestamp  --时间戳，精确到毫秒


#### 2.删除
>fmt: drop table tablename
```sql
drop table emp1;
--不能加where，因为where是对数据操作的
```


#### 3.修改
>FMT: alter table tablename...
#####  增加列
>fmt:alter table tablename add(col1  type,col2  type, ....)
>不会影响到已有的数据
```sql
alter table student add(classes varchar2(16));
```
#####  减少列
>FMT: alter table tablename drop column col;
>删除列时，如果列中有数据，那么该数据被删除

```sql
alter table student
drop column classes;
```

#####  修改列的类型
>FMT: alter table tablename modify(原有列 新的类型);

```sql
alter table student
modify(sname varchar2(64));
```
>如果数据既有的长度，类型与新的数据类型不符合，则无法修改

#####  修改列的名称
>FMT: alter table tablename rename column 原有列名 to 新列名;

```sql
alter table student
rename column sname to studentname;
```
#### 改表名
>FMT :rename 原有的表名 同新表名

```sql
rename student to students;
```
#### 截断表
>FMT: truncate table tablename

```sql
truncate table students;

```
**delete truncate drop**(zhongyao)
**delete** : 是DML语句，删除表中的数据，但是表的结构还在，还会记录每条数据的日志--**数据是可以恢复的**

**truncate**:是DDL语句，删除表中的数据，表的结构还在
仅仅记录操作的日志,数据是不可能恢复的。

**drop**:是DDL语句。直接删除表，标的结构不存在，同样数据也没有

**数据库组成（核心文件）**：
 数据文件
 控制文件
 重做日志文件
