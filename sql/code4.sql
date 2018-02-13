select *from employees
where substr(job_id,1,2)='SA';

select * from employees
where instr(job_id,1,1)>0;

select * from employees
where instr(job_id,1,1)=1;
