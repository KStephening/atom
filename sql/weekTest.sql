--1、	查询至少有一个员工的部门名称和部门人数
select dname,count(empno)
from emp e ,dept d
where e.deptno=d.deptno
group by dname
having count(empno)>=1;
--2、	查询部门人数在2人以上的部门名称、部门人数、最高工资、最低工资
select dname,count(empno),max(sal),min(sal)
from emp e, dept d
where e.deptno = d.deptno
group by dname
having count(empno)>2;

--3、	找出部门10中既不是经理也不是普通员工，而且工资大于等于2000的员工
select * from emp where job <>'MANAGER' AND JOB <>'CLERK'
AND SAL>=2000;
--4、	找出不同工作职位里没有奖金的职位
SELECT DISTINCT JOB FROM EMP WHERE COMM IS NULL
SELECT  JOB FROM EMP WHERE COMM IS NULL  GROUP BY JOB
--结果是一样的，没有分组函数，不建议使用group by,
--查询严格按照执行顺序进行，因此，查询不到工作职位中职员的奖金全为空的工作

--5、	找出没有奖金或者奖金低于500的员工
select * from emp  NVL(COMM,0)<500;
--6、	显示雇员姓名，根据其服务年限，将最老的雇员排在最前面
SELECT ENAME from EMP ORDER BY HIREDATE ASC;
--7、	找出每个月倒数第三天受雇的员工
SELECT * FROM EMP WHERE LAST_DAY(HIREDATE)-HIREDATE=2;
--8、	分组统计各部门下工资>500的员工的平均工资
SELECT DEPTNO,AVG(SAL) FROM EMP
GROUP BY DEPTNO HAVING AVG(SAL)>500
--9、	算出每个职位的员工数和最低工资
SELECT COUNT(*),MIN(SAL) ,JOB FROM emp
GROUP BY JOB;
--10、	列出员工表中每个部门的员工数，和部门编号
SELECT COUNT(*),DEPTNO FROM EMP GROUP BY DEPTNO;
--11、	分组统计每个部门下，每种职位的平均奖金（也要算没奖金的人）和总工资(包括奖金)
SELECT AVG(SAL),SUM(SAL)+sum(nvl(comm,0)) FROM EMP GROUP BY DEPTNO,JOB ;
--12、	查询到平均工资大于2000的工作职位
SELECT JOB FROM EMP GROUP BY JOB HAVING AVG(SAL)>2000;
--13、	查询分部门得到工资大于2000的所有员工的平均工资，并且平均工资还要大于2500
SELECT AVG(SAL) FROM EMP WHERE SAL>2000 GROUP BY DEPTNO HAVING AVG(SAL)>2500;
--14、	以年、月和日显示所有雇员的服务年限
SELECT MONTHS_BETWEEN(SYSDATE,HIREDATE)/12 YEAR,
MONTHS_BETWEEN(SYSDATE,HIREDATE) MONTH,
SYSDATE-HIREDATE DAY FROM EMP;
--15、	显示不带有"R"的员工的姓名
SELECT ENAME FROM EMP WHERE INSTR(ENAME,'R',1,1)=0;
--16、	显示所有员工的姓名,用a替换所有"A"
SELECT REPLACE(ENAME,'A','a') FROM EMP;
--17、	显示满10年服务年限的员工的姓名和受雇日期.
SELECT ENAME,HIREDATE FROM EMP
WHERE MONTHS_BETWEEN(SYSDATE,HIREDATE)/12>10;
--18、	显示所有员工的姓名、加入公司的年份和月份,按受雇日期所在月排序,若月份相同则将最早年份的员工排在最前面
SELECT ENAME,TO_CHAR(HIREDATE,'YYYY') YEAR,TO_CHAR(HIREDATE,'MM') MONTH FROM emp
ORDER BY MONTH,YEAR ASC;--ORDER BY 使用的是select中的别名
--19、	找出在(任何年份的)2月受聘的所有员工
SELECT *FROM EMP WHERE TO_CHAR(HIREDATE,'MM')=2;

SELECT *FROM EMP WHERE TO_CHAR(HIREDATE,'MM')='2';--能执行，但是不能查询出结果

SELECT *FROM EMP WHERE EXTRACT(MONTH FROM hiredate)='2';
SELECT *FROM EMP WHERE EXTRACT(MONTH FROM hiredate)=2;--均能查询出数据
--20、	按照职位统计平均工资最高和最低
SELECT MIN(AVG(SAL)),MAX(AVG(SAL)) FROM EMP GROUP BY JOB;

SELECT AVG(SAL) FROM EMP GROUP BY JOB HAVING AVG(SAL)=MAX(AVG(SAL))
OR AVG(SAL)=MIN(AVG(SAL));--分组函数嵌套太深，不能执行
