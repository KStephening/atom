# 概念03

# 一、SQL函数

## (一).单行函数

> 单行函数只对每一行进行变换，每一行返回一个结果

### 1.字符函数

#### A:大小写转换函数

> 1) `upper(str)` -->将字符转换成大写

```sql
select upper('aHjksK') from dual;
```

> 2) `lower(str)`-->将字符转换成小写

```sql
 select lower('aHjksK') from dual;
```

> 3) `initcap(str)` 将str字符串中每个单词首字母转化为大写，其余字母是小写

```sql
select initcap('i like u');
```

```sql
select * from emp
where upper(ename)=upper('scott');
```

#### B:字符截取函数

`substr(str1,n1,n2)`将`str1`字符串从`n1`开始截取`n2`个字符

>  **NOTE:**`str1`是被截取的字符串 `n1` 开始截取的位置（一般以1开始） 又称为：字符串的下标、索引、角标 `n2` 截取字符的个数

```sql
select substr('gerugu',3,2);
```

例1：查询emp表中员工姓名的前三个字母

```sql
select substr(ename,1,3) from emp;
```

查询名字开头为SMI员工的信息

```sql
select * from emp
where substr(ename,1,3)='SMI';
```

#### C:字符查找函数

`instr(str1,str2,n1,n2)`--返回的是位置

空格也算一个字符，计算位置时从第一个字符开始

找不到---返回0
> 在`str1`字符串中查询`str2`字符串，从`n1`位置起，第`n2`次出现的位置

```sql
select instr('I LIKE GIRL' , 'I',1,3) FROM DUAL;
```

#### D:字符串拼接函数

`concat(str1,str2)`将两个字符串进行拼接，等价于`||`

```sql
select concat('hello ','world') from dual;
select concat(concat('I','love'),'you') from dual;
select 'I ' ||'love '||'you~' from dual;

select substr(concat('i ','love'),1,4);
```

#### E:字符串替换函数

`replace(str1,str2,str3)` 在str1字符串中，使用str3字符串来替换全部str2的字符串

```sql
select replace('abcdefg','cd','hi') from dual;
select replace('I love you','you','中国') from dual;
```

#### F:字符串长度函数

`length(str) `计算该字符串的字符个数

```sql
select length('abcdefg'),length('cd'),length('乖哦') from dual;--中文是占一个字符
select length(replace('I love you','you','中国')) from dual;
```

> NOTE:Oracle中文是占一个字符

#### F:字符串补齐函数

`lpad(str1,n1,str2)`-->左侧补齐 将str1字符串使用str2在左侧补齐到n1个长度

```sql
select lpad('abc',6,'*')as 左侧补齐 from dual;
select rpad('abc',6,'*') as 右侧补齐 from dual;
select lpad('abc',2,'*')as 左侧补齐 from dual;
--结果为    ab  ，无论左右都要从左侧第一个算起
--n1<0时，显示为空，有小数的取整（不能四舍五入）
```

`rpad(str1,n1,str2)`-->右侧补齐 将str1字符串使用str2在左侧补齐到n1个长度

```sql
select rpad('abc',6,'*') as 右侧补齐 from dual;
```

#### G:字符串去除函数

`trim(str) `去除字符串首尾的空格

```sql
select trim('   abc  dfgg    ') as QUCHU from dual;
```

> **NOTE:** 中间的空格不能清除

`trim(str2 FROM str1 ) `去除字符串首尾特定的字符

```sql
select trim('H' from 'HELLOWORLDHH') as trim函数 from dual;
```
例1
```sql
select length(replace('I LOVE YOU','YOU','MYSELF'))FROM DUAL
WHERE LENGTH('AB')=LENGTH(substr(replace('I love you','you','中国'),8,2))
and length('AB')=instr('hello','e',1,1)
and length(rpad(lpad('I Love You',16,'oo'),25,' '))=25
and trim('o' from trim(rpad(lpad('I Love You',16,'oo'),25,' ')))=concat('I Love You','');
```



### 2.数值函数
#### A、round(n1,n2)--将n1的数值四舍五入，精确到小数点后n2位
```sql
select round(3,1415,2) ,round(2.34,0),round(3.14,-1) from dual;
--n2=-1表示精确到小数点前2位
--n2=0 表示精确到小数点前1位
```

#### B、`trunc(n1,n2)`--将`n1`的数值舍弃精确到小数点后`n2`位
```sql
select trunc(3.1415,3),trunc(3.1415,0),trunc(3.1415,-1)from dual;
```
  #### C、`mod(n1,n2)`--求`n1`除以`n2`得到的余数
  先不要看正负，算出结果，然后判断结果正负，取决于被除数
```sql
  select mod(5,3),mod(5,-3),mod(-5,3),mod(-5,-3) from dual;
```
### 3.日期函数 (重要)
#### A. `sysdate`获取数据库所在服务器的当前系统时间
```sql
select sysdate from emp;
```
#### B. `months_between(date1,date2)`--（重要）
  第一个日期与第二个日期的月数差
> NOTE: **date1比date2晚**
> 用于计算司龄，工龄，年龄等类似的随着时间变换的数据

```sql
select ename,trunc(months_between(sysdate,hiredate) ,0)/12 from emp;
```
#### C. add_months(date1,d1)--追加月份函数
date1增加d1个月，结果是日期
```sql
select add_months(sysdate,6) from dual;
select ename,hiredate,add_months(hiredate,6) as 转正日期 from emp；
```
#### D. last_day(date1)--日期所在月份最后一天的日期，结果是日期
```sql
select ename ,hiredate,last_day(hiredate) 最后一天 from emp;
```
#### E.日期减法操作，结果是天数差
```sql
 select last_day(hiredate) - sysdate from emp;
 --结果为负
  select trunc(sysdate-last_day(hiredate),0) as 天数 from emp;
```

#### F.next_day(date1,n1)
距离date1最近的星期`（n1-1）`结果是日期
```sql
select next_day(sysdate,2) as  from dual;--系统时间最近的星期一的日期
select next_day(sysdate,'星期一') as  from dual;--系统时间最近的星期一的日期
```
1:周日
2.周一
3.周三
.....
7.周六

> 是**最近的**，并不是**下星期**


#### G.与日期相关的使用的函数


（1）`round(hiredate,'MONTH')`
例1查询81年入职的员工姓名，入职日期（按照月份四舍五入）
```sql
select ename,hiredate,trunc(hiredate,'month') from emp
where substr(hiredate,-2,2)='81';
```

(2)`substr(date,-2,2)`
```sql
select ename,hiredate,trunc(hiredate,'month') from emp
where substr(hiredate,-2,2)='81';
```
(3)`trunc(hiredate,'MONTH')`
```sql
select ename,hiredate,trunc(hiredate,'month') from emp
where substr(hiredate,-2,2)='81';
```
(4)`extract(month from date)`
```sql
select ename, hiredate,extract(month from hiredate)
from emp where deptno=10;
```







### 4转换函数
#### A.`to_number(str)`文字转化为数值
```sql
select to_number('1234') from dual;
select to_number('1234abcd') from dual;--false!!!!
```
#### B. `to_number(str,fmt)`按照特定格式转换数值
> FMT:格式码,字符串的形式

`$` :美元dollar
`,`：三位分隔符
`9` : 一位数字
`0` :一位数字；前导0
`L` :显示本地货币符号￥
`.` :显示小数点

```sql
select to_number('$23,412,123.34','$99,999,999.00') from dual;
```
> **NOTE:**如果超过格式码的长度，则数值无法显示；少了无所谓

```sql
select to_number('$23333,412,123.34','$99,999,999.00') from dual;--无法显示
```
#### C.to_char(n1,str)-->数值转文字
> **NOTE:**数值转文字会出现货币符号，文字转数值的货币符号不会显示

```sql
select to_char(123456,'$9,999,999') from dual;
```
```sql
select ename, to_char(sal,'$999,999.99') from emp;
```
#### D.to_char(date,fmt)--->根据格式将日期转文字

- `YYYY`--年
- `MM`--月
- `DD`--日
- `DAY`-星期几
- 'DY'-英文缩写显示星期几

```sql
select ename,hiredate,to_char(hiredate,'day') DAY from emp;--可以显示为星期几
select to_char(hiredate,'MM/YYYY') 入职日期 from emp;

```

- `HH24`--24小时进制
- `HH12`--12十二小时进制
- `MI`--分钟
- `SS`--秒
- `/`--常规的日期分隔符
- `:`--常规时间分隔符
- ` `--空格-->日期与时间的分隔符

> **NOTE:** date类型 精确到秒(**false**) 数据库下不是所有的时间类型都是精确到秒
>
> 时间戳（日期类型）精确到毫秒

```sql
select ename,to_char(hiredate,'YYYY/MM/DD HH:MI:SS') from emp;
select ename,to_char(hiredate,'YYYY/MM/MM HH:MI:SS') from emp;--也可以显示
select ename,to_char(hiredate,'YYYY"年"MM"月"MM"日" HH:MI:SS') from emp;
--显示格式为2018年02月02日
```
> **NOTE:** **""**可以将特殊字符显示出来，如在日期中的中文

#### E.`to_date(str,fmt)`-->文字转日期
```sql
select to_date('2018-2-2','YYYY-MM-DD') FROM EMP;
select to_date('2-2月-2018','DD-MM"月"-YYYY') FROM EMP;--前后格式一致
select to_date('2018-2月-2','YYYY-MM"月"-DD') FROM EMP;
select * from emp where
hiredate between(to_date('2018-2-2','YYYY-MM-DD') and to_date('2018-2-2','YYYY-MM-DD');
--标准写法
--显示为2018/2/2
```
