# SQL中的坑
## Little 坑
### 1.null
>null不能参与运算 =null  能运行，但是不能出来结果
```sql

```
>汇总查询函数，sum()avg(),max(),min(),count()
> 除了count()之外，其他的函数默认人不考虑null值

两者的区别
emp.deptno=d.deptno
d.deptno=emp.deptno

```sql
select empno,ename,sal
from emp
where sal= (select min(sal) minSal  from emp d
                    d.deptno=emp.deptno);

                    select empno,ename,sal
                    from emp
                    where sal= (select min(sal) minSal  from emp d
                                        emp.deptno=d.deptno);
```

--• 14. 列出至少有一个雇员的所有部门
```sql
select deptno from emp
group by deptno
having count(*)>0;
--部门有空值，则错误

select deptno from emp
where deptno is not null
group by deptno
having count(*)>0;

```
>正规情况下，表是不允许出现null值
> 但是实际情况下，没有加约束条件，应该考虑到null值



--• 17. 找员工姓名和直接上级的名字
````sql
SELECT E.ENAME,M.ENAME FROM  EMP E,EMP M
WHERE E.MGR=M.empno;

SELECT E.ENAME,M.ENAME FROM  EMP E,EMP M
WHERE E.MGR=M.empno(+);

select ename,(select ename from emp e
                     where (e.empno=m.mgr)) mname
from emp m;

select e.ename,m.ename
from emp m full outer join emp e
on (e.mgr=m.empno);
````
--三种方式结果不同，方式二相当于外连接，第三种方式是全连接




--• 18. 显示部门名称和人数(部门有的没有人)
```sql
SELECT DNAME,(SELECT COUNT(EMPNO)
                           FROM EMP E
                            WHERE E.DEPTNO=D.DEPTNO GROUP BY DEPTNO) CON
FROM  DEPT D;
```
--利用select 子查询，先将count （）子查询写出来，
--关键是如何连接
````sql
select dname ,count(empno)
from emp e join dept d
                  on(e.deptno=d.deptno)
group by dname;
````
--两种方式结果不同，方式一显示了所有的dname
--（包括没有员工的部门）
```sql
select dname ,count(empno)
from emp e tight join dept d
                  on(e.deptno=d.deptno)
group by dname;
```
### ROWNUM
-- • 26. 显示出平均工资最高的的部门平均工资及部门名称
```sql
SELECT AVG(SAL),DNAME
FROM EMP E JOIN DEPT D
            ON( E.DEPTNO=D.DEPTNO)
GROUP BY DNAME
HAVING AVG(SAL)=(SELECT max(AVG(SAL)) FROM EMP
                                GROUP BY Deptno);

select t.dname,t.avgSal
from (SELECT dname ,avg(sal) avgSal
          from emp e ,dept d
          where e.deptno=d.deptno
          group by dname
          order by avgSal) t
where rownum=1;
```
>NOTE:ROWNUM只能使用在最高最低，
> 如果是范围前两名，第二名，只能使用别名的方式


4.查询每个部门工资最低的两个员工编号，姓名，
工资

--  • 4.查询每个部门工资最低的两个员工编号，姓名，  工资
select EMPNO,ename,sal,deptno
from emp e
where (select count(empno)
         from emp
        where deptno =e.DEPTNO
      and sal <e.sal)<=1;


      select ename from emp where sal = (select max(sal) from emp) ;
select *
  from (select ename,
               sal,
               d.deptno,
               row_number() over(partition by d.deptno order by sal) rn
          from emp e, dept d
         where e.deptno = d.deptno)
where rn < 3
KA
看看是不是， SQL多写写就熟了。




SQL> select * from (select ename,sal,row_number() over(partition by deptno order by sal desc ) rn,deptno  from emp) where rn<3;

ENAME             SAL         RN     DEPTNO
---------- ---------- ---------- ----------
KING             5000          1         10
CLARK            2450          2         10
SCOTT            3000          1         20
FORD             3000          2         20
BLAKE            2850          1         30
ALLEN            1600          2         30

6 rows selected.
这样是不是也可以 不关联dept 表
使用道具 举报 回复
latch_free


SELECT *
  FROM (SELECT ENAME,
               SAL,
               DEPTNO,
               RANK() OVER(PARTITION BY E.DEPTNO ORDER BY E.SAL DESC) RO
          FROM SCOTT.EMP E)
WHERE RO < 3;
SELECT *
  FROM (SELECT ENAME,
               SAL,
               DEPTNO,
               ROW_NUMBER() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) RN
          FROM SCOTT.EMP E)
WHERE RN < 3;
