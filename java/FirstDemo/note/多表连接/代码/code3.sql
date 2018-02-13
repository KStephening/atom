
select department_name,first_name
from employees e,departments d
where e.deparment_id(+)=d.department_id;

select department_name,first_name
from employees e,departments d
where e.manager_id(+)=d.employees_id;
