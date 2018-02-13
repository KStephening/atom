select upper('hello') from dual;

select lower('Hellpo') from dual;

select initcap('i like U ha ') from dual;

select  * from emp;
where upper(ename)=upper('scott');

select substr('hrhiih',2,1) from emp;

select substr(ename,1,3) from emp;

select * from where substr(ename,1,3)='SMI';

select instr('i like u iiiii','i',1,4) from dual;
 select concat('come on',' , baby') from dual;
 select concat('I love ','中国') from dual;

 select replace('I love you','you','中国') from dual;

 select replace('I love you ','you','中国')from dual;

 select trim('     hi,my baby     ') from dual;
