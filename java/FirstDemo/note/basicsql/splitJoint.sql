select * from emp;
select ename as 员工姓名，sal from emp;


--知识点：字符串的拼接，设置别名，sql运算
select ename,sal,'员工的奖金是'||comm as 奖金，(sal+comm)*12 as 年收入 from emp;
--奖金列没有值的选项叫做空值null
--1、null值参与的是数值运算，结果一定是null（800+null=null）
--2、null值参与字符串的拼接，是没有任何效果的
   ----'员工的奖金是'||null='员工的奖金是'
   null  --标识符
   'null'--字符串
   ''--空字符串
--Oracle特有函数  nvl(expr1,expr2)
--功能：当expr1的结果是null，使用expr2表达式的结果
--nvl(null,13)
nvl(comm,0)
select ename,sal,'员工的奖金是'||comm as 奖金，(sal+comm)*12 as 年收入 from emp;


select ename,sal,'员工的奖金是'||nvl(comm,0) as 奖金,(sal+nvl(comm,0))*12 as 年收入
 from emp;
--向数据库存储数据时，要尽量避免录入null值

--去重复数据  distinct
--查询所有的部门编号，要求去掉重复数据
select distinct deptno from emp;
--注意：distinct只能防在select与列名之间 select ditinct 列名1，列名2... from 表名
--查询所有职位信息，去重
select distinct job from emp;


--书写规范，加空格
--大小写都可以，要么全大写，要么全小写，或者首字母大写
--关键字，符号，列名，表名...建议用空格分隔开
--遵循一屏原则


--%不能直接使用

select ename，sal*6+sal*6*1.2 as 年薪 from emp;
select ename ,sal*6+sal*6*1.2+12*nvl(comm,0) as "年薪(工资加奖金)" from emp;
--起名字的时候加括号（），冒号：，等特殊字符不行
select ename,sal*2.2*6 salSUM,--总薪水
nvl(comm,0)*12 commSUM,--总奖金
sal*2.2*6+nvl(comm,0)*12 SUM--总收入
from emp;

--显示为--XXX的第一年总收入为XXX
select ename||'的第一年总收入为'||(sal*6+sal*6*1.2+12*nvl(comm,0)) as "年薪(工资加奖金)" from emp;

select * from emp,dept,salgrade;--记录数量三者相乘
--emp 5条 *dept 4 * salgrade 14=280
