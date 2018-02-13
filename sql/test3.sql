select max(salary),min(salary),avg(salary) from employees group by job_id;

select department_id,avg(salary) from employees where salary>8000
group by department_id;

select avg(salary) from employees
group by department_id,manager_id;

select job_id,avg(salary) from employees where salary>8000 group by job_id;

select avg(salary) from employees where months_between(sysdate,hire_date)/12>20;

select max(salary),min(salary) from employees
where hire_date<to_date（'1-1-1995','dd-mm-yyyy'）;

select department_id,count(employee_id) from employees group by department_id;
select department_id,count(*) from employees group by department_id;--*代表全部

select department_id,sum(salary) from employees group by department_id;

select avg(salary) from employees
where hire_date between to_date('1-1月-1993','dd-mm"月"-yyyy')
and to_date('31-12月-1993','dd-mm"月"-yyyy') ;

select to_char(salary*(1+nvl(commission_pct,0))*12,'$999,999.99')  as 年收入 from employees
where hire_date between  to_date('1-1月-1990','dd-mm"月"-yyyy')
and to_date('31-12月-1990','dd-mm"月"-yyyy');


select sum(sal),avg(sal) from emp where deptno=20;

select  count(empno),max(salary),min(salary)
from employees,deptno
where emp.deptno=dept.deptno and
location_id='CHICAGO';

select count(distinct job) from emp;

select deptno,dname,count(empno) 部门人数,max(sal),min(sal),sum(sal),avg(sal)
from emp e,dept d
where e.deptno=d.deptno
group by deptno;

select deptno,dname,job,count(*),max(sal),min(sal),sum(sal),avg(sal)
from emp e,dept d
where e.deptno=d.deptno
group by dept,job;

select count(*),mgr,ename
from emp
where mgr=empno or mgr is null
group by mgr;




select emp.deptno,dname,count(*)
from emp,dept
where emp.deptno=dept.deptno
group by emp.deptno,dname
having count(empno)>2;

select deptno,dname,count(*),avg(sal)
from emp,dept
where emp.deptno=dept.deptno
group by deptno
having count(*)>2;

select dept, avg(sal) from empno
having avg(sal)>2500;

select job,avg(sal) from empno
where job not like 'SA%'
group by job
having avg(sal)>2500;

select dname,round(min(sal),0),round(max(sal),0)
from emp,dept
having count(*)>2 and emp.deptno=dept.deptno
group by deptno,dname;

select job,sum(sal) from emp
where job <>'SALESMAN'
group by job
having sum(sal)>2500;

select worker.ename,manager.empno,min(worker.sal)
from emp worker,emp manager
where worker.mgr=manager.empno
group by manager.empno,worker.ename
having min(worker.sal)>3000;

select max(sal)-min(sal) 工资差额 from emp
group by deptno;






select avg(salary) from employees where salary>8000 group by department_id;

select job_id,avg(salary) from employees
where  job_id not like 'SA7_%'escape '7'
group by job_id
having avg(salary)>8000
order by avg(salary) desc;

select job_id,sum(salary) from employees
where job_id<>'AD_PRES'
group by job_id
having sum(salary)>=25000;

select manager_id,min(salary)
from employees
group by manager_id
having min(salary)>3000
--having not min(salary)<3000
order by min(salary) desc;


select '姓'||last_name||'名'||first_name
from employees;

select sum(salary),avg(salary)
from employees;

select *from employees
where salary>12000;

select * from employees
where hire_date between to_date('1/1/1998','dd/mm/yyyy')
 and to_date('31/12/1998','dd/mm/yyyy');

 select * from employees
 where department_id is null;

 select * from employees
 where job_id='FI_ACCOUNT'
 or salary>16000 and job_id='AD_VP';

 select employee_id,first_name||Last_name,job_id,
 length(Last_name)
 from employees
 where job_id like '____UNT' and last_name like '%A%';

 select avg(salary)
from employees
group by job_id,manager_id;

select avg(salary) from employees
order by avg(salary) asc;
