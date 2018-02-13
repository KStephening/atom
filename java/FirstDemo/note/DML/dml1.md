# DM
## 1.insert
>FMT: `insert table (col1,col1,col3...) values(value1,value2,value3...);`
> FMT:`insert into tabe values(value1,value2,value3...)`--这种凡事没有指定具体的列，需要为表中和每一个列复制，值得顺序要与表中列顺序一样

```sql
insert into emp(empno,ename,sal,deptno) values(1001,'xixi',1000,40);
insert into emp values(1003,'xixi','xixi',1788,sysdate,1000,null,40);

insert into manger
  select * from emp
  where job='MANAGER';--向manager中插入manager的记录
```
>NOTE: INSERT INTO 多行数据，不必加values
> FMT：INTSERT INTO TABLENAME 子查询
## 2.delete
>FMT: `delete (from) table where...`
> NOTE:如果不写where，则表示删除全部

```sql
delete emp where deptno=40;
delete emp1 where ename='SCOTT';
```

  --基于另一个表来删除本表的记录
```sql
DELETE FROM  MANAGER1
WHERE deptno=(SELECT deptno
                         FROM dept
                             WHERE dname='SALES');
```
相关delete
```sql
delete from dept
  where 0=(select count(empno)
                     from emp
                     where deptno=dept.deptno);

delete from dept
 where not exists (select count(empno)
                    from emp
                      where deptno=dept.deptno);
```




## update
>FMT: `update table set col =newValue ,col=... where ...`
> NOTE:如果不写where则表示，更新所有数据

利用相关子查询来更新一个表中的行，该行给予另一个表的行
`UPDATE table1 alias1
SET column = (SELECT expression
FROM table2 alias2
WHERE alias1.column =
alias2.column);`

```sql
ALTER TABLE emp1
ADD(dname VARCHAR2(14));

UPDATE emp1
SET dname=(SELECT dname FROM dept
                  WHERE deptno=emp1.deptno);
```

```sql
UPDATE emp1
SET job ='MANAGER',hiredate=to_date('1999-1-1','yyyy-mm-dd')
WHERE ename='haha';

UPDATE emp1
SET sal=sal+200
WHERE DEPTNO=(SELECT deptno
                           FROM dept
                           WHERE dname='SALES');

UPDATE EMP1 W
SET SAL=SAL+200
WHERE SAL>(SELECT AVG(SAL) FROM EMP1
                     WHERE DEPTNO=W.DEPTNO)
```

## create
```sql
create table emp1
  as select * for emp;
  ```
