-- 例题
--(1)查询1982年入职，其上司的员工的编号为7782，7788的员工信息
--(2)查询姓名中包含至少有一个O，至少一个T的员工信息（要求o在T的前面）
--(3)查询员工的姓名，月薪，奖金，按照年收入进行升序排序
--(4)查询在10号部门，月薪在2000-3000之间的员工信息
--(5)查询奖金是null的员工信息

select * from emp where hiredate between '1-1月-1982' and '31-12月-1982'
and ( mgr=7782 or mgr=7788);
select * from emp where ename like '%O%T%';
select ename,sal,comm from emp order by (sal+nvl(comm,0))*12 asc;
select * from emp where deptno=10 and sal between 2000 and 3000;
select * from emp where comm||0=0 and comm<>0;--null不能参与运算
select * from emp where comm||0=0 and nvl(comm,1)<>0;
select * from emp where comm is null;


--NOTE1:NULL参与排序的时候默认值是最大值


--1.查询入职时间在1982-7-9之后，并且不从事SALESMAN工作的
--员工姓名、入职时间、职位。
--2.查询员工姓名的第三个字母是a的员工姓名。
--3.查询除了10、20号部门以外的员工姓名、部门编号。
--4.查询部门号为30号员工的信息，先按工资降序排序，再按姓
--名升序排序。
--5.查询没有上级的员工(经理号为空)的员工姓名。
--6.查询工资大于等于4500并且部门为10或者20的员工的姓名\工
--资、部门编号。

select ename,hiredate,job from emp
where hiredate<'9-7月-1982' and job<>'SALESMAN';
select ename from emp where ename like '__a%';
select ename ,deptno from emp where deptno not in(10,20);
select * from emp where deptno =30 order by sal desc ,ename asc;
select ename from emp where mgr is null;
select ename ,sal, deptno from emp where deptno in(10,20) and sal>4500;



select ename from emp
where ename like '__a%';

select ename,deptno from emp
where deptno not in (10,20);

--字符串函数
select upper('aHjksK') from dual;
select lower('aHjksK') from dual;
select initcap('i like u');
select * from emp
where upper(ename)=upper('scott');
select ename=
