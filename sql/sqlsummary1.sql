--sql总结一

select * from emp;
select col1,col2...coln from emp;
--两个的效率，前一个更优

select * from emp
where loginname='admin' and loginpass=''
or 1=1 and loginname='admin';
--早期盗号漏洞


-- 如何解锁用户
--1. 用管理员用户登录 sys（权限最高）密码sys sysdba身份
--2. 通过指令解锁hr用户
alter user hr identified by hr;--设置hr用户hr密码
alter user hr account unlock;--结果hr用户
--点击钥匙，登录hr账户,在下方切换至scott@orcl

--DQL--数据查询语言
--DDL--数据定义语言--针对数据库对象
--DML--数据操作语言--增删改
--DCL--数据控制语言--系统权限或者是用户权限
--TPL--事务处理语言--事物就是由多个DML语句组成的操作

--数据库发展阶段
--层次型、网状型
--关系型
--对象型

--数据库--数据存储仓库
--数据库管理系统--数据文件、控制文件、重做日志文件


select distinct deptno from emp;

select count(distinct deptno) from emp;

select ename from emp where ename like 'AHl_' escape 'l';

select ename,sal from emp where sal not between 100 and 888;

select ename ,sal,deptno from emp order by 2,3 desc;
--order by 可以用数字来表示第2列，第3列替代

select upper('hello'),lower('HEllo'),initcap('world,a') from dual;

select substr('i love you',8,3) from dual;

select instr(ename,'A',2,2) from emp;

select lpad(ename,10,'*') from emp;

select trim(lpad(ename,10,'*')) from emp;

select replace(upper('i love you~'),Upper('you'),'中国') from dual;

select mod(sal,comm) from emp;

select to_date('1/1月-1998','dd/mm"月""-yyyy') as date from dual;
--显示结果为1998/1/1
select to_char(hiredate,'dd/mm"月"-yyyy') as date from emp;
--显示结果形式为1/1月-1998

select nvl(comm,0) 奖金,nvl2(job,'is not null','is null') from emp;
--函数内部的两个参数类型应为一样
