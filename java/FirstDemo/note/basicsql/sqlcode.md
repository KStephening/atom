# code2
## 一、条件语句
### **（一）where子语句**
>格式：**select ... from ... where 条件**

```sql
select * from emp where deptno=10;
```

```sql
select * from emp where sal<=1600;
```

>**NOTE:** 不等于：

1.  ！=
2.  <>

```sql
select * from emp where deptno!=20;
```
```sql
select * from emp where deptno<>20;
```

### **（二）与关系**
>关键字and

```sql
select * from emp where deptno=20 and sal>2000 and job= 'MANAGER';
```
>**NOTE:** 数据本身是区分大小的

### **（三）或关系**
>关键字or

```sql
select * from emp where deptno=20 or sal>2000;
```
### **（四）and 和or 一起使用**
>**NOTE1:** `and`优先级高于`or`
>
>**NOTE2:** 最好加上小括号，控制优先级的先后顺序

`例1：查询在10号部门工作或者工资高于2500并且职位是MANAGER 的员工信息`

```sql
select * from emp where deptno=20 or sal>2500
and job='MANAGER';
```
```sql
select * from emp where (deptno=20 or sal>2500)
and job='MANAGER';--加括号控制优先级
```

```sql
select * from emp where comm||0=0;--null和0拼接还是0，性质法
--不建议使用，代码不易读
```
## 二、特殊的比较运算符
### （一）between ... and ...
>1、格式： 列名 between 下限 and 上限（上限）下限）
>表示的区间范围（包含两个端点） 相当于 a<=  x <=b ;
>NOTE:数据库中常用的数据类型

-   文字
-   数值
-   日期/时间

>NOTE: between ... and .. 常用于日期和数值的比较


```sql
select * from emp
where hiredate between '1-1月-1982' and '31-12月-1982';--仅限于Oracle的中文环境
--隐藏发生的数据类型转换，将字符转换为日期类型，在进行的区间限定
```
>NOTE:如果比较的是字符串
> 按照字典顺序进进行比较（英文字母先后顺序）

```sql
select * from emp
where hiredate between 'ALLEN' and 'WARD';
```
>**列名 between 上限 and 下限**
>NOTE: 语句不会报错，但是逻辑上无法实现，没有结果

```sql
select * from emp where (hiredate =between'1-1月-1981'and '31-12月-1981' )and  (sal between  1200 and 1800);
```

### （二）IN
#### 1.等价多次等值表达式以或形式存在
```sql
mgr =7768 or mgr=7766 or mgr = 7968
```

>in 格式： 列名 IN（值1，值2 ，值3...）
>


```sql
select * from emp where mgr in(7902,7698,7788) and deptno=30;
```
### (三) LIKE... 像... (重要) --模糊查询
>NOTE:相似不相等,只能用于文字类型的模糊查询

例1：查询所有名字首字母是B的员工信息
```sql
select * from emp where ename like 'B%';
```
>利用通配符
>1.  % :0-任意个字符 abc a
> 2. _ :一个任意字符

例2：查询倒数第二个字符是T的员工信息
```sql
select * from emp where ename like '%T_';
```
```sql
select * from emp where job like 'MAN';--like此处表示=
```
>escape关键字


例3：查询emp表中开头为MAN_的职位
```sql
select * from emp where job like 'MAN/_%' escape '/' ;--转义字符 escape后的字符可以为任意字符-----/可以用其它的字符代替
```
```sql
select * from emp where job like 'MAN%_%%' escape '%' ;--此处%不再有通配符作用
```
&emsp;&emsp;你好啊
&emsp;`&emsp;`表示空格，两个就是两个空格 &emsp; 好

### （四）is null
>用于筛选空值
> 因为=null的逻辑关系null，不能够筛选出空值

```sql
select * from emp where comm=0 or comm is null;
```
>Oracle的逻辑关系结果有三种：true &emsp;&emsp; false&emsp;&emsp; **null**

查询boss是谁，即上级为null

```sql
select * from emp where mgr is null;
```
### （五）not
>(一)至（四）都可以结合not使用

```sql
--not between ... and ...
select * from emp where sal not between 1000 and 2000;
```
```sql
--not  in(a,c,b)
select * from emp where mgr not in(7902,7890,7289);
```
```sql
--not like
select * from emp where emame not like 'S%';
```
```sql
--is not null
select * from emp where comm is not null;--不能写为not is null
```

## 三、扩展（数据注入漏洞）and 和 or  登录
```sql
select *from userinfo where loginname='haha' and loginpass='123456';
```

```sql
select *from userinfo where loginname='haha'
and loginpass='' or 1=1 and loginname='haha';
--不需要密码就可以查出信息，早期盗号
--目前用Java来控制漏洞
```
