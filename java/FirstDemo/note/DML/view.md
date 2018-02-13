# 其它数据库对象
## 1.视图
视图不是具体的数据而是表中数据的一种映射
创建视图 `create view viewname as( select * from emp)；`

### 修改scott用户权限
利用sys用户
创建视图的权限
```sql
GRANT CREATE VIEW TO scott;

create view empinfo as( select e.*,dname,loc
                            from emp e,dept d
                              WHERE e.deptno=d.deptno)；
SELECT ename ,dname FROM empinfo;
```
>NOTE : 如果表中的数据被改变，则视图查询的结果也会变。视图的查询结果是实时的。
>视图也可以修改数据

### 使用视图原则
1.将不同表中经常用的列关联，不经常用的列不要关联，会影响效率
2.如果表中的数据敏感，不想让别人看到

视图命名规则：
视图与表名不能重复
```sql
create view emp as select ename,hiredate from emp;--视图与表名重复，不能执行
```
### update view
```sql
update  empinfo
set sal =sal+200
where ename='SMITH';
```
### drop view
```sql
drop view empinfo;
```

Oracle命名规则：
表    tab_XXXX   XXXX_tab
视图 view_XXXX XXXX_view
序列 seq_XXXX XXXX_seq
索引 idx_XXXX XXXX_idx

练习（hr用户）
```sql
create view emp1_view
as
(select *
from employees NATURAL LEFT JOIN departments );

create view emp1_view
as
(select e.*,d.department_name,d.manager_id  经理,d.location_id
from employees e  JOIN departments d on(e.department_id=d.department_id));
```
## 2.序列
--有序的数列
### 创建序列
```sql
create sequence dept_seq
  increment by 10--每次增长多少，负数表示减少多少
  start with 50
  minvalue=10                   --最小值
  maxvalue=90               --最大值
cycle                                    --是否循环
--nocycle                             --不循环，一般是不循环
nocache；                              --存储模式


```
### 当前值
```sql
select dept_seq.currval   -当前值
from dual;

```
### 下一个值
```sql
select dept_seq.nextval   -当前值
from dual;
```
### 序列应用
```sql
insert into dept values(dept_seq.nextval,'xixi','beijing');
```
## 索引
--方便查找（查询速度效率是比较高），
--相对于新增和删除的效率较低
### 手动创建

>fmt: `create index indexname on tablename(col)`


### 自动创建
当表创建主键或者唯一约束时，自动在对应的列上创建索引。


























请您根据以上张某的设计，完成以下SQL语句：
1.请写出“学生选课信息表”的建表语句，要求在建表的同时建立相应的约束。

2.查询全部学生的学号、学生姓名、班级名称、所选课程名称、成绩。

3.查询每门课程都有多少学生选择，要求显示课程名称，所选人数。
 
4.查询选课多于2门的学生SQL语句，要求显示学生姓名，选课数量

5.学生王丽转入到班级名称为“Java开发一班”的班级，请写出相应的SQL语句。（提示：用update语句）
