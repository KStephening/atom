# effiency

## 一、关键字的作用
### 1.`distinct`在子查询中
```
select ename
from emp
where empno not in(select distinct MGR
                   from emp
                   where mgr is not null);
--distinct加上，提高了效率
```

### 2.`*`的效率
```
select * from emp ;

select col1,col2,...coln from emp ;

-- *  的效率小于全部列都写上
--但是对于会提高程序员的写代码效率
```
### 3.`in` 和 `=`
>在一般情况下，=是优于in的效率
> 但是情况并不是唯一的

### 4.`exists` 和 `in`

## 二、高级
### 1.
```sql
SELECT ENAME,JOB
FROM EMP
WHERE (JOB,MGR) IN(SELECT JOB,MGR FROM EMP
                                     WHERE ENAME IN('SCOTT','BLAKE'))
               AND ENAME NOT IN ('SCOTT','BLAKE');
               --不相关子查询
select ename,e.JOB
from emp e join (select job ,mgr from emp
                         where ename in('SCOTT','BLAKE')) t
 on (e.mgr=t.mgr and e.job=t.job )
  where ename not in('SCOTT','BLAKE') ;
          --相关子查询
```
### 2.查询员工工资为其部门最低工资的员工的编号和姓名及工资。
```sql
select empno,ename,sal
from emp ,(select min(sal) minSal,deptno  from emp group by deptno) d
where sal=d.minSal and emp.deptno=d.deptno;

select empno,ename,sal
from emp ,(select min(sal) minSal,deptno  from emp) d
where sal=d.minSal and emp.deptno=d.deptno;
--分组

select empno,ename,sal
from emp
where sal= (select min(sal) minSal  from emp d
                    d.deptno=emp.deptno);
```
