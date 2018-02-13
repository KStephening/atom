--hr表下
--1.查询与Neena同一个经理的其他员工
SELECT * FROM EMPLOYEES E
WHERE MANAGER_ID=(SELECT MANAGER_ID
                                       FROM EMPLOYEES WHERE
                                        FIRST_NAME='Neena')
              AND FIRST_NAME<>'Neena';

 SELECT e.* FROM EMPLOYEES E JOIN
                                         (SELECT Manager_id FROM EMPLOYEES
                                           WHERE FIRST_NAME='Neena') M
                                   ON (E.MANAGER_ID=M.MANAGER_ID)
where first_name<>'Neena';
--2.查询比Jennifer Whalen 月薪高的员工
SELECT * FROM EMPLOYEES
WHERE SALARY >(SELECT SALARY FROM EMPLOYEES
                              WHERE FIRST_NAME||LAST_NAME='JenniferWhalen');
--3.查询员工姓名，月薪和其部门的平均月薪
select first_name,salary,avgSal
from EMPLOYEES e join (select avg(salary) avgSal,department_id from employees a
                                        group by department_id ) a
            on(e.department_id=a.department_id);

select first_name,salary,avgSal
from EMPLOYEES e left join (select avg(salary) avgSal,department_id from employees a
                                        group by department_id ) a
                        on(e.department_id=a.department_id);
--左连接

select e.first_name,e.salary ,(select avg(salary) from employees a
                                        where a.department_id=e.department_id group by department_id)
from employees e ;
--4.查询月薪高于其部门的平均月薪的员工
select * from employees e join (select avg(salary) avgSal,department_id
                                                 from employees   group by department_id) t
                        on (e.department_id=t.department_id)
where salary> avgSal;

select * from employees e
where salary>(select avg(salary) from employees t
                     where e.department_id=t.department_id );

--5.查询司龄高于部门的平均司龄的员工
select e.*
from employees e join (select avg(sysdate-hire_date) avgSal,department_id from employees
                                    group by department_id) t
        on(e.department_id=t.department_id)
where sysdate-hire_date >avgSal;
--不正确，不能用天数去计算司龄，因为，一年并不是365天
--如老员工干了十年退休了，新员工干了十年也退休了，但是其中的天数可能不一样
select e.*
from employees e join (select avg(months_between(sysdate,hire_date)/12) avgSal,department_id from employees
                                    group by department_id) t
        on(e.department_id=t.department_id)
where sysdate-hire_date >avgSal;



--练习一
--• 1.查询入职日期最早的员工姓名，入职日期
select ename,hiredate from emp e
where hiredate =(select min(hiredate) from emp );

-- 2.查询工资比SMITH工资高并且工作地点在
--CHICAGO的员工姓名，工资，部门名称
select ename,sal,dname
from emp e,dept d
where e.deptno=d.DEPTNO
and loc = 'CHICAGO'
AND SAL>(SELECT SAL FROM EMP WHERE ENAME='SMITH');

SELECT ename,sal,dname FROM  EMP E  JOIN DEPT D
ON(E.DEPTNO=D.DEPTNO)
WHERE LOC='CHICAGO' AND SAL>(SELECT SAL FROM EMP
                                                        WHERE ENAME='SMITH');
--3.查询入职日期比20部门入职日期最早的员工还
--要早的员工姓名，入职日期
SELECT ENAME,HIREDATE FROM EMP
WHERE HIREDATE <(SELECT MIN(HIREDATE) FROM EMP
                                  WHERE DEPTNO=20);

SELECT ENAME,HIREDATE FROM EMP E ,
                            (SELECT MIN(HIREDATE) MINdate FROM EMP
                            WHERE DEPTNO =20) T
WHERE HIREDATE<MINdate;

-- 4.查询部门人数大于所有部门平均人数的的部门
--编号，部门名称，部门人数

SELECT D.DEPTNO,DNAME,COUNT(EMPNO)
FROM DEPT D ,EMP E
WHERE   D.DEPTNO=E.DEPTNO
GROUP BY D.DEPTNO,DNAME
HAVING COUNT(E.EMPNO)>(SELECT AVG(COUNT(EMPNO))
             FROM EMP GROUP BY DEPTNO);

             --有分组还有

--练习2
--1.查询入职日期比10部门任意一个员工晚的员工
-- 姓名、入职日期，不包括10部门员工
SELECT ENAME,HIReDATE
FROM EMP,(SELECT max(HIREDATE) maxdate FROM EMP
                                WHERE DEPTNO=10) e
WHERE HIREDATE>maxdate
              AND DEPTNO<>10;
--错误，因为此处结果求得是all，而不是any

SELECT ENAME,HIReDATE
FROM EMP,(SELECT min(HIREDATE) mindate FROM EMP
                                WHERE DEPTNO=10) e
WHERE HIREDATE>maxdate
              AND DEPTNO<>10;
--此处求的是any


select ename,hiredate from emp
where hiredate> any(select hiredate from emp
                                 where deptno=10)
          and deptno <>10;
--2.查询入职日期比10部门所有员工晚的员工姓名
--入职日期，不包括10部门员工
SELECT ENAME,HIREDATE FROM EMP
WHERE  HIREDATE >(SELECT MAX(HIREDATE) FROM EMP
                                 WHERE DEPTNO=10)
              AND DEPTNO<>10;

select ename,hiredate from emp
where hiredate > all(select hiredate from emp where deptno =10)
           and deptno<>10;
--3.查询职位和10部门任意一个员工职位相同的员
--工姓名，职位，不包括10部门员工
SELECT ENAME,JOB FROM EMP
WHERE HIREDATE IN(SELECT HIREDATE FROM EMP
                                  WHERE DEPTNO=10);
              AND DEPTNO<>10;

              SELECT ENAME,JOB FROM EMP
              WHERE HIREDATE =any(SELECT HIREDATE FROM EMP
                                                WHERE DEPTNO=10);
                            AND DEPTNO<>10;

                            SELECT ENAME,JOB FROM EMP e
                            WHERE exists (SELECT * FROM EMP d
                                                              WHERE DEPTNO=10
                                                                 e.hiredate=d.hiredate);
                                          AND DEPTNO<>10;
--练习3
--1.查询职位及经理和10部门任意一个员工职位及
--  经理相同的员工姓名，职位，不包括10部门员工
SELECT ENAME,JOB FROM EMP
WHERE (JOB,MGR) IN(SELECT JOB,MGR FROM EMP
                                  WHERE DEPTNO=10 )
             AND DEPTNO<>10;

 SELECT ENAME,JOB FROM EMP
WHERE (JOB,MGR) EXISTS(SELECT JOB,MGR FROM EMP
                                               WHERE DEPTNO=10 )
                          AND DEPTNO<>10;

--2.查询职位及经理和10部门任意一个员工职位或
--  经理相同的员工姓名，职位，不包括10部门员工
SELECT ENAME,JOB FROM EMP
WHERE (JOB,MGR) IN(SELECT JOB,MGR FROM EMP
                                      WHERE DEPTNO=10)
            OR MGR IN(SELECT MGR FROM EMP
                              WHERE DEPTNO=10)
          AND DEPTNO<>10;

select  ename,job from emp e
where exists (select 1 from emp
                      where emp.mgr=e.mgr AND emp. job=e.job
                                   AND deptno = 10)
           or exists (select 1 from emp d
                          where e.mgr=d.mgr
                                      AND deptno=10);


--练习4
--1.查询比自己职位平均工资高的员工姓名、职位
--，部门名称，职位平均工资
SELECT ENAME,E.JOB,DNAME,AVGSAL
FROM EMP E JOIN (SELECT AVG(SAL) AVGSAL,JOB FROM EMP
                                 GROUP BY JOB) A
                       ON(E.JOB=A.JOB)
                        JOIN DEPT D ON(E.DEPTNO=D.DEPTNO)
WHERE E.SAL>A.AVGSAL;
  --2.查询职位和经理同员工SCOTT或BLAKE完全相同
  --的员工姓名、职位，不包括SCOOT和BLAKE本人。
SELECT ENAME,JOB
FROM EMP
WHERE (JOB,MGR) IN(SELECT JOB,MGR FROM EMP
                                     WHERE ENAME IN('SCOTT','BLAKE'))
               AND ENAME NOT IN ('SCOTT','BLAKE');
               --不相关子查询
select ename,e.JOB
from emp e join (select job ,mgr from emp
                         where ename in('SCOTT','BLAKE')) t
 on (e.mgr=t.mgr and e.job=t.job )
  where ename not in('SCOTT','BLAKE') ;
          --相关子查询

-- 3.查询不是经理的员工姓名。
SELECT EMPNO,ENAME FROM EMP d
WHERE  NOT EXISTS(SELECT 1 FROM EMP e
                                WHERE e.mgr=d.empno);

select ename
from emp
where empno not in(select distinct MGR
                                  from emp
                                  where mgr is not null);
--distinct加上，提高了效率


--练习5
--• 1.查询入职日期最早的前5名员工姓名，入职日
--期。
SELECT ENAME,HIREDATE,ROWNUM FROM
            (SELECT ENAME,HIREDATE FROM EMP
              ORDER BY HIREDATE ASC)
WHERE  ROWNUM<=5;
--• 2.查询工作在CHICAGO并且入职日期最早的前2名
--员工姓名，入职日期。
SELECT ENAME,HIREDATE,ROWNUM
FROM  (SELECT ENAME,HIREDATE,DEPTNO FROM EMP
              ORDER BY HIREDATE,ENAME,DEPTNO ASC) A,
              DEPT D;
WHERE     D.DEPTNO=A.DEPTNO
              AND LOC ='CHICAGO'
            ROWNUM<=2 ;

--练习6
          --  • 1.按照每页显示5条记录，分别查询第1页，第2
            --页，第3页信息，要求显示员工姓名、入职日期
          --  、部门名称
          SELECT ename,hiredate ,dname,ROWNUM
          FROM (SELECT * FROM emp e JOIN
                   dept d ON(e.deptno=d.deptno))
          WHERE ROWNUM<=5;
--第一页
          SELECT ename,hiredate,dname,rn
          FROM (SELECT ROWNUM rn,e.*,d.*
                      FROM  emp e JOIN dept d
                                ON(e.deptno=d.deptno)
                        WHERE ROWNUM<=10)
          WHERE rn>5;
--第二页
          SELECT ename,hiredate,dname,rn
          FROM (SELECT ROWNUM rn,e.*,d.*
                      FROM  emp e JOIN dept d
                                ON(e.deptno=d.deptno)
                        WHERE ROWNUM<=15)
          WHERE rn>10;
--第三页

--七练习
--按照每页显示五条记录，分别查询工资最高的第一页，第二页第三页信息，
--要求先试员工姓名、入职日期、部门名称、工资
SELECT ename,hiredate,dname,sal
FROM (SELECT ROWNUM rn ,a.*
            FROM (SELECT * FROM emp e
                                   JOIN dept d ON(e.deptno=d.deptno)
                          ORDER BY sal DESC ) a
             WHERE ROWNUM <=1*5  )
WHERE rn>0*5;
--一
SELECT ename,hiredate,dname,sal
FROM (SELECT ROWNUM rn ,a.*
            FROM (SELECT * FROM emp e
                                   JOIN dept d ON(e.deptno=d.deptno)
                          ORDER BY sal DESC ) a
             WHERE ROWNUM <=2*5  )
WHERE rn>1*5;
--二
SELECT ename,hiredate,dname,sal
FROM (SELECT ROWNUM rn ,a.*
            FROM (SELECT * FROM emp e
                                   JOIN dept d ON(e.deptno=d.deptno)
                          ORDER BY sal DESC ) a
             WHERE ROWNUM <=3*5  )
WHERE rn>2*5;
--三

 --课后作业
 --• 1.查询工资高于编号为7782的员工工资，并且和7369号员
 --工从事相同工作的员工的编号、姓名及工资。
 select empno,ename,sal
 from emp
 where sal>(select sal from emp where empno=7782)
 and job=(select job from emp where empno=7369);

SELECT e.empno,e.ename,e.sal
FROM emp e JOIN (SELECT sal FROM emp
                               WHERE empno=7782) d
                               ON(e.sal>d.sal)
               AND job=(SELECT job FROM emp WHERE empno=7369) ;

SELECT e.empno,e.ename,e.sal
FROM emp e JOIN (SELECT job FROM emp
                               WHERE empno=7369) d
                               ON(e.job=d.job)
               AND e.sal>(SELECT sal FROM emp WHERE empno=7782) ;
 --• 2.查询工资最高的员工姓名和工资。
 select ename,sal from emp
 where sal =(select max(sal) from emp);

 --• 3.查询部门最低工资高于10号部门最低工资的部门的编号、
 --名称及部门最低工资。
 select e.deptno,dname,min(sal)
 from emp e,dept d
 where e.deptno=d.deptno
 group by e.deptno,dname
 having min(sal)>(select min(sal) from emp where deptno=10 );

 select d.deptno,dname,minSal
 from dept d join (select deptno,min(sal) minSal
                             from emp group by deptno) t
                     on( d.deptno=t.deptno)
 where   t.minSal>(select min(sal) from emp where deptno=10);

 --• 4.查询员工工资为其部门最低工资的员工的编号和姓名及
 --工资。
 select empno,ename,sal
 from emp ,(select min(sal) minSal,deptno  from emp group by deptno) d
where sal=d.minSal and emp.deptno=d.deptno;

select empno,ename,sal
from emp ,(select min(sal) minSal,deptno  from emp) d
where sal=d.minSal and emp.deptno=d.deptno;

--• 5.显示经理是KING的员工姓名，工资。
select ename,sal from emp
where mgr =(select empno from emp where ename='KING');

select ename,sal from emp join(select empno from emp where ename='KING') t
on mgr =t.empno;

select ename,sal from emp ,(select empno from emp where ename='KING') t
where mgr =t.empno;

 --• 6  6.显示比员工SMITH参加工作时间晚的员工姓名，工资，
 --参加工作时间。
 select ename,sal,hiredate from emp
 where hiredate >(select hiredate from emp where ename='SMITH');

 --• 7.使用子查询的方式查询哪些职员在NEW YORK工作。
 select e.* from emp e,dept d where e.deptno=d.DEPTNO
 and loc='NEW YORK';

 select e.*
 from emp
 WHERE  DEPTNO=(select deptno from dept
                                 where loc='NEW YORK');

 select e.*
 from emp E ,
          (select deptno from dept  where loc='NEW YORK') D
 WHERE  E.DEPTNO=D.DEPTNO;
 --• 8 一一 8.写 个查询显示和员工SMITH工作在同 个部门的员工
 --姓名，雇用日期，查询结果中排除SMITH。
 SELECT ENAME,HIREDATE
 FROM EMP
 WHERE DEPTNO=(SELECT DEPTNO FROM emp WHERE ENAME='SMITH')
             AND ENAME<>'SMITH';

 --• 9.写一个查询显示其工资比全体职员平均工资高的员工编
 --号、姓名。
 SELECT EMPNO,ENAME
 FROM EMP
 WHERE SAL>(SELECT AVG(SAL) FROM EMP);
 --• 10.写一个查询显示其上级领导是King的员工姓名、工资。
 SELECT ENAME,SAL FROM EMP
 WHERE MGR=(SELECT EMPNO FROM EMP
                        WHERE ENAME='KING');
 --1  • 11.显示所有工作在RESEARCH部门的员工姓名，职位。
 SELECT  ENAME ,JOB FROM EMP E,DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND dname='RESEARCH';
 --• 12.查询每个部门的部门编号、平均工资，要求部门的平
 --均工资高于部门20的平均工资。
 SELECT DEPTNO,AVG(SAL)
 FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL)>(SELECT AVG(SAL) FROM EMP
                                  WHERE DEPTNO=20 );
 --• 13.查询大于自己部门平均工资的员工姓名，工资，所在
 --部门平均工资，高于部门平均工资的额度。
 SELECT ENAME,SAL,AVGSAL,(SAL-AVGSAL) 差额
 FROM EMP E,(SELECT AVG(SAL) AVGSAL,DEPTNO FROM EMP
                      GROUP BY deptno) D
  WHERE  SAL>AVGSAL
  AND E.DEPTNO=D.DEPTNO;

  SELECT ENAME,SAL,(SELECT AVG(SAL)FROM EMP F
                                  WHERE E.DEPTNO=F.DEPTNO) AVGSAL,
                                  SAL-(SELECT AVG(SAL)FROM EMP F
                                  WHERE E.DEPTNO=F.DEPTNO) 差额
  FROM EMP E
  WHERE SAL>(SELECT AVG(SAL)FROM EMP D
                         WHERE E.DEPTNO=D.DEPTNO
                         GROUP BY DEPTNO);
 --• 14. 列出至少有一个雇员的所有部门
select deptno from emp
group by deptno
having count(*)>0;--部门有空值，则错误

select deptno from emp
where deptno is not null
group by deptno
having count(*)>0;

--  15. 列出薪金比 SMITH 多的所有雇员
select * from emp
where sal>(select sal from emp
                    where ename='SMITH');

 --• 16. 列出入职日期早于其直接上级的所有雇员

 --有  早于 等比较类字眼，因此需要where语句或where子查询
 --或者是having子语句
 SELECT e.* FROM EMP E,EMP D
 WHERE E.MGR=D.EMPNO
 and E.HIREDATE <D.HIREDATE;
--链接、筛选
select * from emp e ,(select empno,hiredate from emp ) D
where E.MGR=D.EMPNO
           and E.HIREDATE <D.HIREDATE;


select * from emp e
where e.hiredate<(select hiredate from emp m
                              where e.mgr=m.EMPNO);
--高级子查询

 --• 17. 找员工姓名和直接上级的名字
 SELECT E.ENAME,M.ENAME FROM  EMP E,EMP M
 WHERE E.MGR=M.empno;

 SELECT E.ENAME,M.ENAME FROM  EMP E,EMP M
 WHERE E.MGR=M.empno(+);

select ename,(select ename from emp e
                      where (e.empno=m.mgr)) mname
from emp m;

select e.ename,m.ename
from emp m full outer join emp e
on (e.mgr=m.empno);
--三种方式结果不同，方式二相当于外连接，第三种方式是全连接


 --• 18. 显示部门名称和人数
 SELECT DNAME,(SELECT COUNT(EMPNO)
                             FROM EMP E
                             WHERE E.DEPTNO=D.DEPTNO GROUP BY DEPTNO) CON
 FROM  DEPT D;
--利用select 子查询，先将count （）子查询写出来，
--关键是如何连接
select dname ,count(empno)
from emp e join dept d
                   on(e.deptno=d.deptno)
group by dname;
--两种方式结果不同，方式一显示了所有的dname
--（包括没有员工的部门）
select dname ,count(empno)
from emp e tight join dept d
                   on(e.deptno=d.deptno)
group by dname;



 --• 19. 显示每个部门的最高工资的员工
 SELECT * FROM EMP
 where (DEPTNO,sal) in(select DEPTNO,MAX(SAL)from emp
                 group by deptno);

 SELECT A.* FROM EMP A join (select deptno,max(sal) maxSal
                                           from emp
                                           group by deptno) B
                  ON(A.DEPTNO=B.DEPTNO)
WHERE A.SAL=B.maxSal;

--• 20. 显示出和员工号7369部门相同的员工姓名，工资
SELECT ENAME,SAL FROM EMP
WHERE DEPTNO=(SELECT DEPTNO FROM EMP
                                WHERE EMPNO=7369);
-- • 21. 显示出和姓名中包含"W"的员工相同部门的员工姓名
SELECT ENAME FROM EMP
WHERE  DEPTNO=  (SELECT DEPTNO FROM EMP
                                WHERE  ENAME LIKE'%W%');
 --• 22. 显示出工资大于平均工资的员工姓名，工资
 SELECT ENAME,SAL FROM EMP
 WHERE SAL>(SELECT AVG(SAL) FROM EMP );
 --• 23. 显示出工资大于本部门平均工资的员工姓名，工资
SELECT ENAME,SAL FROM EMP E
 WHERE SAL >(SELECT AVG(SAL) FROM EMP D
                      WHERE E.DEPTNO=D.DEPTNO
                        GROUP BY DEPTNO);

 SELECT ENAME,SAL FROM EMP E JOIN
               (SELECT AVG(SAL) AVGSAL,DEPTNO FROM EMP
                GROUP BY DEPTNO) T
                ON(E.DEPTNO=T.DEPTNO)
 WHERE SAL >AVGSAL;

 --• 24. 显示每位经理管理员工的最低工资，及最低工资者的姓名
SELECT MINSAL,ENAME
FROM EMP E ,
                (SELECT MGR,MIN(SAL) MINSAL
                 FROM EMP GROUP BY MGR) D
WHERE D.MGR=E.MGR
             and sal=minSal;
-- • 25. 显示比工资最高的员工参加工作时间晚的员工姓名，参加
 --工作时间
 SELECT SYSDATE-HIREDATE FROM EMP
 WHERE HIREDATE>(SELECT HIREDATE FROM EMP
                                 WHERE SAL=(SELECT MAX(SAL) FROM EMP));
-- • 26. 显示出平均工资最高的的部门平均工资及部门名称
SELECT AVG(SAL),DNAME
FROM EMP E JOIN DEPT D
            ON( E.DEPTNO=D.DEPTNO)
GROUP BY DNAME
HAVING AVG(SAL)=(SELECT max(AVG(SAL)) FROM EMP
                                GROUP BY Deptno);

select t.dname,t.avgSal
from (SELECT dname ,avg(sal) avgSal
          from emp e ,dept d
          where e.deptno=d.deptno
          group by dname
          order by avgSal) t
where rownum=1;
