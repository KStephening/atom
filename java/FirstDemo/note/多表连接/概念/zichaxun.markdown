## 分页查询
### A.`rownum` 伪列
>查询记录输出的时候产生
> 每次查询，返回结果集的顺序号
>NOTE:rownum与order by的执行顺序
> NOTE:rownum在where子语句中只能使用<,<=

```sql
select rownum,* from emp;
```
查询工资最高的三个人
```sql
select rownum,e.*
from emp e
WHERE rownum<=3
order by sal desc;
--先执行rownum<=3，然后再排序，错误

select rownum,e.*
from (select * from emp order by sal desc)  e
where rownum<=3;
```
查询工资第3，4，5
```sql
select rownum,e.*
from (select * from emp order by sal desc) e
where rownum between 3 and 5;
--rownum在where中可以筛选条件只能使用< ,<=
--rownum在where中可以筛选条件只能使用< ,<=

SELECT *
FROM (select ROWNUM aa,e.*
                from (select a.* from emp a order by sal desc) e)
where aa between 3 and 5;


select rownum,e.*
from (select * from emp order by sal desc) e
where rownum <= 5
minus   --差集
select rownum,e.*
from (select * from emp order by sal desc) e
where rownum <= 2;
```
>NOTE:`rownum`在where中可以筛选条件只能使用`<` ,`<=`

### B.不排序的分页
每页显示5条记录，分别查询第一页，第二页，第三页信息，要求
显示员工姓名、入职日期、部门名称
```sql
select b.*
from (select rownum rn [col1...]
           from [表...]
          where [条件...]
                     and  rownum<=目标页数*每页记录数) b
where rn>(目标记录数-1)*每页记录数

SELECT b.*
from (select rownum as rn ,ename,hiredate,DNAME
         from emp e,dept d
         where e.deptno=d.DEPTNO
                    and rownum<=1*5) b
where rn >(1-1)*5;
--第一页
SELECT b.*
from (select rownum as rn ,ename,hiredate,DNAME
         from emp e,dept d
         where e.deptno=d.DEPTNO
                    and rownum<=2*5) b
where rn >(2-1)*5;
--第二页
SELECT b.*
from (select rownum as rn ,ename,hiredate,DNAME
         from emp e,dept d
         where e.deptno=d.DEPTNO
                    and rownum<=3*5) b
where rn >(3-1)*5;
--第三页

```
### 不排序的分页
按照每页显示五条记录，分别查询工资最高的第一页，第二页第三页
信息。要求显示员工姓名、入职日期，部门名称，工资
```sql
select  *
from (select rownum rn,b.*
          from ( select [col..]
                     from [biao...]
                       where[条件。。]
                       order by 要排序的列 asc|desc) b
          where rownum <=目标页数*每页记录数
        )
where rn>(目标页数-1)*目标记录数


select *
from (select rownum,b.*
         from (select ename,hiredate,dname,sal
                   from emp e,dept d
                  where e.deptno=d.deptno
                  order by sal desc) b
         where rownum<=1*5
          )
where rn>0*5;
--第一页
select *
from (select rownum,b.*
         from (select ename,hiredate,dname,sal
                   from emp e,dept d
                  where e.deptno=d.deptno
                  order by sal desc) b
         where rownum<=1*5
          )
where rn>1*5;
--第二页


select *
from (select rownum,b.*
         from (select ename,hiredate,dname,sal
                   from emp e,dept d
                  where e.deptno=d.deptno
                  order by sal desc) b
         where rownum<=1*5
          )
where rn>0*5;
--第三页
```
### any
查询比jennifer月薪高的员工
```sql
select * from employees e
where e.salary>any (select salary from EMPLOYEES
                          where first_name='Jennifer');
                          --Jennifer有两个人
```
### all
查询比jennifer月薪高的员工
```sql
select * from employees e
where e.salary>any (select salary from EMPLOYEES
                          where first_name='Jennifer');
                          --Jennifer有两个人
```
### union,union all 并集
union 去掉重复的记录
默认按照结果集的第一列进行排序
```sql
select ename,sal
from emp
where sal>1000
union
select ename,sal
from emp
where sal<1500
```

union all
不排序
包含重复记录
```sql

select ename,sal
from emp
where sal>1000
union all
select ename,sal
from emp
where sal<1500
```
### 交集 intersect
```sql

select ename,sal
from emp
where sal>1000
intersect
select ename,sal
from emp
where sal<1500
```
>note：集合运算要遵循的的重要前提
组成集合的多个sql语句，其查询结果
1. 类型一致
2. 意义相同
3. 结果相同

类型同，意义不同，结果可以显示
```sql
select ename,sal
from emp
where deptno=10
intersect
select ename,comm
from emp
where deptno=10
```

类型不同直接报错
```sql
select ename,sal
from emp
where deptno=10
intersect
select ename,hiredate
from emp
where deptno=10
```

结构不同
```sql
select ename,sal
from emp
where deptno=10
intersect
select ename,sal,hiredate
from emp
where deptno=10
```
##高级子查询
查询月薪高于其部门的月薪的员工
```sql
select *
from employees e
WHERE salary>(select avg(salary)
                        from employees ee
                       where ee.department_id=e.department_id);
```
外部每次查询一次，则子查询执行一次
针对外部的主查询的记录都要去算一下部门的平均工资，然后再用自己的工资和平均工资进行比较



查询月薪高于其职位的平均月薪的员工信息
```sql
select * from  emp e
where sal>(select avg(sal) from emp d
                  where e.job=d.job
                  group by JOB);

```
![cantoon](1.jpg)
![tihi](D:/googleDown/b27b375b378922d57fcd56da410f24f3.jpg)
![tihi](http://img.blog.csdn.net/20150316184625949)
###exists ,not exists
查询所有是经理的信息
```sql
select * from  employees e
where e.employee_id in (select distinct MANAGER_ID from employees);

select * from  employees e
                  where exists (select 1
                    from employees ee
                   where ee.MANAGER_ID=e.MANAGER_ID);

 select * from  employees e
where not in (select 1  from employees ee
                    where ee.MANAGER_ID=e.MANAGER_ID);
                          --有空值

  select * from  employees e
 where not exist (select 1
        from employees    ee  where ee.MANAGER_ID=e.MANAGER_ID);
    --避免not in 出现null值的问题
```
>Question:what is the most efficent between in and exists
