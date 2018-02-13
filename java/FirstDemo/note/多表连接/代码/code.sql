--等值连接
select ename,dname from emp,dept
where sal>1500 and --筛选条件
emp.deptno=dept.deptno;--链接条件
