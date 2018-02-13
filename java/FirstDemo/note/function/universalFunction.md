# 5.通用函数
## A.nvl(expr1,expr2)
当expr1不是null时，函数结果是expr1
当expr1是null时，函数结果是expr2
```sql
select sal+nvl(comm,-500)+500 月收入 from emp;
select sal,comm,sal+nvl(comm+500,0) 月收入 from emp;
```
### B.nvl2(expr1,expr2,expr3)
判断expr1是否为空值，如果是，使用expr3的值
如果不是null，使用expr2的值
```sql
select ename,comm,nvl2(comm,1,2) from emp;
select ename,comm,nvl(comm,0)+nvl2(comm,1000,800) from emp;
select ename,comm,nvl2(comm,1000,800) as 福利 from emp;
```
>`dual`表 作用：为了补全sql语句使用 （虚表）

## C.NULLIF(expr1,expr2)
>如果expr1=expr2
> 则返回NULL
```sql
select ename,nullif(deptno,10)
from emp;
```
