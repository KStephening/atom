--练习一
select * from DEPT t
select deptno,loc from dept;
select ename,sal*2.2*6+nvl(comm,0)*12
as 年收入,hiredate as 入职日期 from emp;
select * from emp where job='CLERK';
select * from emp where sal>1000 and sal<2500;
select ename,mgr  from emp where mgr=7902 oR mgr=7698 or mgr=7788;
select * from emp where sal>3000 or sal<1000;
select * from emp where nvl(comm,0)=0;
