# CODE 4
## （二）.多行函数
> 多函数对一组进行处理，然后针对该组记录只返回一个结果
## 分组函数
### 1.sum()求和函数
```sql
select sum(sal)from emp;
```
### 2.avg()平均值

```sql
select  sum(sal) from emp;
select avg(sal) from emp;
select avg(months_between(sysdate,hiredate)/12) from emp;
```
### 3.max()求达最大值函数
```sql
select  max(sal) as MaxSal from emp;

```
### 4.`min()`求最小值函数
```sql
select min(sal) from emp;
```
### 5.`count()`统计计数函数
```sql
select count(empno) from emp;
select count( distinct deptno) from emp;
```
### 6.`group by `分组依据
```sql
select deptno,avg(sal) from emp group by deptno;
```
>只有在`group by`中出现的列，才可以写在`select`中，也可以不写
> 没有在group by出现的列不可以写在select中
> select (列1，列2) avg(sal) from 表名 group by 列1，列2
> 多次分组，第二次分组是在第一次分组的基础上进行的

```sql
select deptno,job,avg(sal) from emp group by deptno,job order by deptno asc;
select deptno,avg(sal) from emp where deptno in(20,10) group by deptno ;
```

>书写顺序:`select... from...where...group by..having...order by...`
>
>执行顺序: `from...where...group by...having...select...order by... `

### 6.having--处理分组函数的条件筛选
group by... having...
```sql
select deptno,avg(sal) from emp where avg(sal)>2500 group by deptno;--电脑无法识别到底是哪个的平均工资
select deptno,avg(sal) from emp group by deptno having avg(sal)>2500 ;
select deptno,avg(sal) from emp group by avg(sal) between 2000 and 2500;
```
>where 中不能出现分组函数，不能出现别名


```sql
select department_id,count(*) from employees group by department_id;--*代表全部
```
>`*`代表全部
