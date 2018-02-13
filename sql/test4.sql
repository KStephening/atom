select ename,emp.deptno,dname
from e

















mp,dept
where emp.deptno=dept.deptno;

select ename,loc,comm
from emp e,dept d
where e.deptno=d.deptno
and comm is not null;

select ename,loc
from emp e, dept d
where ename like '%A%';

select empno,ename,sal,grade,loc
from emp e,dept d,salgrade s
where e.deptno=d.deptno
and e.sal between losal and hisal
order by grade asc;

select E.ename 员工姓名,E.empno 员工编号,
M.ename 经理姓名,M.empno 经理编号
from emp e,emp m,dept d
where e.mgr=m.empno
and e.deptno=d.deptno
and loc in('NEW YORK','CHICAGO');

select E.ename 员工姓名,E.empno 员工编号,
M.ename 经理姓名,M.empno 经理编号
from emp e,emp m,dept d
where e.mgr=m.empno(+)
and e.deptno=d.deptno(+)
and loc in('NEW YORK','CHICAGO')
order by e.empno;

select empno,ename,e.deptno
from emp e,dept d
where e.deptno=d.deptno(+)
