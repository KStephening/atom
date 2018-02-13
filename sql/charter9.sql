--1.查询比所在职位平均工资高的员工姓名，职位
select ename,job
from emp e
where sal=(select max(sal) from emp d
                   where d.empno=d.empno
                    group by job)
-- 2.查询工资为其部门最低工资的员工编号，姓名工资。
select empno,ename
from emp e
where sal=(select min(sal)
                    from emp d
                     where e.empno=d.empno
                   group by deptno);

                  -- 1.查询所有雇员编号，名字和部门名字。
select empno,ename,dname
from   emp e,dept d
where e.deptno=d.deptno
--若使用相关子查询，应当使用select下的子查询

                --  • 2.查询哪些员工是经理？
select *
from emp
where empno=(select mgr
                          from emp
                         where e.mgr=ee.empno)

select * from emp ee
where exists(select 1
                  from emp e
                    where e.mgr=ee.empno)

select *
from emp
where   empno=(select mgr
                            from emp)
                --  • 3.查询哪些员工不是经理？
select * from emp e
where 0=(select count(empno)
                from emp d
              where e.empno=d.mgr
            group by mgr)

  select * from emp e
            where 0=(select count(empno)
                            from emp d
                          where e.empno=d.mgr);.

select * from emp ee
where not exists(select 1
                      from emp e
                      where e.mgr=ee.empno)

  --  • 4.查询每个部门工资最低的两个员工编号，姓名，  工资
select EMPNO,ename,sal,deptno
from emp e
where (select count(empno)
           from emp
          where deptno =e.DEPTNO
        and sal <e.sal)<=1;
