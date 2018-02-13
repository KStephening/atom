--练习一
INSERT INTO emp
VALUES(8888,'BOB','CLERK',7788,to_date('03-03月-1985','dd-mm"月"-yyyy'),3000,NULL,NULL);

CREATE TABLE manager AS
SELECT * FROM emp WHERE 1=0;

CREATE TABLE manager1 AS
SELECT * FROM emp;

--练习二
CREATE TABLE emp_back AS SELECT * FROM
emp WHERE 1=0;

INSERT INTO emp_back
SELECT * FROM emp WHERE hiredate>to_date('1-1月-1982','dd-mm"月"-yyyy');

INSERT INTO manager
 SELECT *
FROM emp
WHERE job = 'MANAGER';

--练习三
 UPDATE emp
 SET ADD()
 WHERE hiredate>'31-12月-1982'；

 UPDATE emp
 SET comm=0
 WHERE comm IS NULL;

 UPDATE emp
 SET sal=sal+500
 WHERE deptno IN (SELECT deptno
                           FROM dept
                           WHERE loc IN('NEW YORK','CHICAGO'));


ALTER TABLE emp1
ADD(dname VARCHAR2(14));

UPDATE emp1
SET dname=(SELECT dname FROM dept
                  WHERE deptno=emp1.deptno);





DELETE FROM emp1
WHERE job='CLERK';

DELETE emp1
WHERE job='CLERK';

DELETE FROM emp1;

--基于另一个表来删除本表的记录

DELETE FROM  MANAGER1
WHERE deptno=(SELECT deptno
                         FROM dept
                             WHERE dname='SALES');

--练习6
DELETE FROM emp
WHERE empno=7566;

DELETE FROM emp
WHERE deptno=(SELECT deptno FROM dept
                         WHERE loc='NEW YORK');

DELETE FORM emp e
WHERE sal >(SELECT AVG(sal)FROM emp
                   WHERE deptno=e.deptno) ;



CREATE TABLE students(
         xh CHAR(4),
         xm  VARCHAR2(10),
         sex CHAR(2),
         birthday DATE,
         sal NUMBER(7,2),
         studentcid NUMBER(2)
) ;

CREATE TABLE CLASS(
       classid NUMBER(2),
       cname VARCHAR2(20),
       ccount NUMBER(3)
);


--课后作业
INSERT INTO CLASS (classid,cname,ccount)
VALUES
   (1,'JAVA1班',NULL);

  INSERT INTO CLASS (classid,cname,ccount)
VALUES   (2,'JAVA2班',null) ;


INSERT INTO CLASS (classid,cname,ccount)
VALUES
   (1,'JAVA1班',NULL);

  INSERT INTO CLASS (classid,cname,ccount)
VALUES   (2,'JAVA2班',null) ;

  INSERT INTO CLASS (classid,cname,ccount)
VALUES   (3,'JAVA3班',null) ;

INSERT INTO students
VALUES('A001','张三','男','01-5月-05',100,1);

INSERT INTO students
VALUES('A002','张三','男','01-5月-05',100,1);

 INSERT INTO students (xh,xm,sex);
 VALUES('A003','JOHN','女');

UPDATE students
SET sex='女'
WHERE xh='A001';

UPDATE  students
SET sex='男',birthday='1-4月-80';

UPDATE students
SET studentcid=(SELECT classid FROM CLASS
                           WHERE cname='JAVA3')
WHERE birthday IS NULL;

UPDATE CLASS a
SET ccount=(SELECT COUNT(xh)
                  FROM students
                  WHERE studentcid=a.classid);


CREATE TABLE copy_emp (
empno number(4),
ename varchar2(20),
hiredate date default sysdate ,
deptno number(2),
sal number(8,2));

--课后作业
INSERT INTO copy_emp VALUES
(1,'ss','1-1月-00',50,NULL);

INSERT INTO copy_emp
SELECT empno,ename,hiredate,deptno,sal FROM emp WHERE deptno=10;


UPDATE  copy_emp
SET sal=sal*(1+0.2)
WHERE deptno=10;


UPDATE copy_emp
SET sal=(SELECT AVG(sal) FROM copy_emp)
WHERE sal IS NULL;

DELETE FROM emp
WHERE sal IS NULL;
