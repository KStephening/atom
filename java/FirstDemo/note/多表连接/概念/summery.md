# Summery

##1.查询部门人数大于所有部门平均人数的的部门编号，部门名称，部门人数
>分析：可以看到有分组，部门分组，且有分组函数count(),avg(),还有大于
> 因此应该想到用having的设置筛选条件

```sql
SELECT D.DEPTNO,DNAME,COUNT(EMPNO)
FROM DEPT D ,EMP E
WHERE   D.DEPTNO=E.DEPTNO
GROUP BY D.DEPTNO,DNAME
HAVING COUNT(E.EMPNO)>(SELECT AVG(COUNT(EMPNO))
             FROM EMP GROUP BY DEPTNO);--不相关子查询

             SELECT e.DEPTNO,DNAME,avG(e.a)
             FROM (SELECT COUNT(EMPNO) a,deptno
                          FROM EMP GROUP BY DEPTNO) e,dept d
             WHERE   D.DEPTNO=E.DEPTNO
             GROUP BY e.DEPTNO,DNAME,a
             HAVING AVG(e.a)<=e.a;
--false ,因为分组问题，AVG(e.a)求的是按本部门的平均人数
--即avg(e.a)=e.a

```
#### 查询部门最低工资高于10号部门最低工资的部门的编号、名称及部门最低工资。
```sql
select e.deptno,dname,min(sal)
from emp e,dept d
where e.deptno=d.deptno
group by e.deptno,dname
having min(sal)>(select min(sal) from emp where deptno=10 );

select d.deptno,dname,minSal
from dept d join (select deptno,min(sal) minSal
                            from emp group by deptno) t
                    on( d.deptno=t.deptno)
where   t.minSal>(select min(sal) from emp where deptno=10);
```
### 2.查询职位和10部门任意一个员工职位相同的员工姓名，职位，不包括10部门员工

>使用exists时，里面必须有链接条件

```sql
SELECT ENAME,JOB FROM EMP
WHERE HIREDATE IN(SELECT HIREDATE FROM EMP
                                  WHERE DEPTNO=10)
              AND DEPTNO<>10;

SELECT ENAME,JOB FROM EMP
WHERE HIREDATE =any(SELECT HIREDATE FROM EMP
                                      WHERE DEPTNO=10)
                            AND DEPTNO<>10;

SELECT ENAME,JOB FROM EMP e
WHERE exists (SELECT * FROM EMP d
                       WHERE DEPTNO=10  AND e.hiredate=d.hiredate)
              AND DEPTNO<>20;
```
### 3.查询工资高于编号为7782的员工工资，并且和7369号员工从事相同工作的员工的编号、姓名及工资。
>`from`语句的万能作用

```sql
select empno,ename,sal
from emp
where sal>(select sal from emp where empno=7782)
and job=(select job from emp where empno=7369);

SELECT e.empno,e.ename,e.sal
FROM emp e JOIN (SELECT sal FROM emp
                              WHERE empno=7782) d
                              ON(e.sal>d.sal)
              AND job=(SELECT job FROM emp WHERE empno=7369) ;

SELECT e.empno,e.ename,e.sal
FROM emp e JOIN (SELECT job FROM emp
                              WHERE empno=7369) d
                              ON(e.job=d.job)
              AND e.sal>(SELECT sal FROM emp WHERE empno=7782) ;
```


```sql
select ename,sal,hiredate from emp
where hiredate >(select hiredate from emp where ename='SMITH');

select ename,sal,hiredate from emp e
    join (select hiredate from emp where ename='SMITH') t
 on(e.hiredate >t.hiredate);
```
