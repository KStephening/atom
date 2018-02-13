#  SQL代码--01
## 一、显示全部列的信息
```
select * from emp;
select 列1，列2... from emp;```
### 1. ***** 可以代表所有的列名
### 2. 两种方式的效率:第一种查询效率比第二种略低
>**NOTE:** 建议使用第一种方式查询所有列，书写简便

## 二、字符串拼接—使用 **||** 进行拼接
>例1： 显示员工编号，员工的姓名，显示”职位是XXX”，工资

```
select empno, ename, '职位是' || job, sal from emp;```



>**NOTE:** oracle中字符串需要在英文单词或者其他文字的两端加上**单引号**

## 三、列的别名
### 1、利用空格
```
select empno, ename, '职位是' || job Haha, sal from emp;-- 大写英文别名

select empno 员工编号, ename 员工姓名,'职位是' || job 描述, sal
from emp;--中文别名
```
>**NOTE1:** 如果使用双引号声明的别名，则会区分大小写
>
`select empno, ename, '职位是' || job "haha", sal from emp;`--**小写英文**

>**NOTE2:** 要求列名为 ha ha  **(有空格)**
>
  `select empno, ename, '职位是' || job "ha ha", sal from emp;`

### 2、建议使用 **as** 关键字 **(便于识别)**
```
select empno, ename, '职位是' || job as "ha ha", sal from emp;```

## 四、关于**NULL**
>某表的列中没有值的选项，叫做空值null

### 1、null值参与运算时的两个原则
- **原则一：**null值参与的是数值运算，结果一定是**_null_**

> 800 + null = null


- **原则二：**null值参与字符串的拼接，_**没有任何效果的**_


> `员工的奖金是`|| null = ‘员工的奖金是’
>
> **NOTE：** **‘’**-->空字符串,绝对不是null

### 2、Oracle特有函数 格式：nvl(expr1,expr2)

- 功能：当expr1的结果是null时，使用expr2表达式的结果

–**NOTE：**向数据库中存储数据时，要**尽量避免录入null值**


## 五、**distinct**--去重复数据
>例1：查询所有的部门编号，要求去掉重复数据

>select ename, distinct deptno from emp; --**位置错误**
>
>**NOTE:** **distinct**只能放在select与第一个列名之间的位置

### 正确格式：select distinct 列名1,列名2,…列名n from 表名
>例2：查询所有职位信息，去除重复数据

>select **distinct** job from emp;
