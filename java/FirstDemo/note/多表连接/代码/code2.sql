select manager_id,min(salary)
from employees
group by manager_id
having min(salary)>3000
--having not min(salary)<3000
order by min(salary) desc;
