# code3
### 1、`order by` 子语句
### A：针对结果集进行排序&emsp; **升序**&emsp;**降序**&emsp;

> **升序**:`asc`(有时默认是升序,但是不建议省略关键字)
>
> **降序**:`desc`
>
>(1) 数值：小-->大，大-->小
>
>(2)日期：早-->晚
>
>(3)文字：a-->z，z-->a

```sql
select * from emp where deptno=10 order by sal asc;--升序    带asc代码更清晰
```
```sql
select * from emp  where deptno=10 order by sal desc;--降序
```
### B： `order by number`
```sql
select sal,ename,deptno from emp order by 3;--针对查询结果的第三列进行排序（deptno）
```
### C: 利用别名进行排序 `order by 别名`

```sql
select sal,ename,(sal + nvl(comm，0)）*12 as 年收入 from emp order by 年收入;
--针对查询结果的第三列进行排序（deptno）
```
> **NOTE:**`where`子语句中**不能使用**列的别名

```sql
select empno ,(sal + nvl(comm，0)）*12 as 年收入 from emp where 年收入 ORDER by EMPNO ASC;
--不能执行，因为where不认可  年收入  是别名
```
> 书写顺序：`select...from...where...order by...`
>
> 执行顺序：`from...where...select...order by...`
>


```sql
select empno ,(sal + nvl(comm，0)）*12 as 年收入 from emp
where (sal + nvl(comm，0)）*12 >15000 ORDER by EMPNO ASC;
--不能执行，因为where不认可  年收入  是别名
```

### D: 多列排序
```sql
select * from emp order deptno asc,sal desc;
--第二次的排序实在第一次的排序的基础上排序
--第一次按照部门编号升序排序，然后每个部门中按照月薪降序排序
```

例1 :三次排序
查询员工信息，按照部门升序排序，月薪降序,排序入职日期升序排序
```sql
select * from emp order by deptno  asc ,sal desc ,hiredate asc;
```
## 2、关于NULL
例1：查询奖金是null的员工信息
```sql
select * from emp where comm||0=0 and comm<>0;--null不能参与运算
select * from emp where comm||0=0 and nvl(comm,1)<>0;
select * from emp where comm is null;
```

> **NOTE1:**`NULL`参与排序的时候默认值是最大值
>
> **NOTE2:**如果出现NULL
>
> (1)首先联想is null和is not null
>
> (2)其次联想nvl(,)函数
>
> (3)最后联想空值的连个原则（与数值运算，与字符拼接）
