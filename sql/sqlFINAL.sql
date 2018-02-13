--1.查询所有学员的姓名，年龄（显示整数，如24.75岁，按照24岁显示），
--所学专业名称，所属班级
SELECT stu_name,trunc(months_between(sysdate,stu_birthday)) age ,
                          major_name,stu_class
from student s, major m
where s.stu_major=m.major_id;
--2.查询专业编号，专业名称，专业人数
select major_id,major_name,(select count(stu_id) from student
                                              where stu_major=m.major_id )
from major m;
--3.查询班级人数高于 各班级平均人数的 班级编号，班级名称,班级人数
select class_id,class_name,con
from sclass s,(select count(stu_id) con,stu_class from student
                            group by stu_class) sc
where s.class_id=sc.stu_class
        and      con>(select AVG(count(stu_id)) con from student
                                    group by stu_class);

--可以使用group by stu_class,class_name

--4.查询学员学号，学员姓名，其平均分，并按照平均分由高至低进行排序
select s.stu_id,stu_name,avgScore
from student s,(select avg(score) avgScore,stu_id from stu_course
                          group by stu_id) sc
where s.stu_id=sc.stu_id
order by avgScore DESC;

--5.查询各班级各科目的平均分，显示班级名称，科目名称，平均分
select avg(Score),class_name,c_name
from sclass sc,course c,student s,stu_course scc
where scc.course_id=c.c_id and s.stu_class=sc.class_id
AND  s.stu_id=scc.stu_id
GROUP BY class_name,c_name;
--6.查询与Lu同班级，平均分高于Lu的平均分的其他学员的信息
select s.*,avgscore
from student s ,(select avg(score) avgScore,stu_id from stu_course
                          group by stu_id) sc
where s.stu_id=sc.stu_id and
           stu_class=(select stu_class from student where stu_name ='Lu' ) and
           avgScore>(SELECT avgScore from (select avg(score) avgScore,stu_id from stu_course
                                                                group by stu_id) sc,student s
                           where s.stu_id=sc.stu_id and  stu_name ='Lu');
--7.查询选课人数最多的课程名称及选课人数和课程平均分
select c_name,con,avgscore
from course c,(select avg(score) avgScore,COUNT(stu_id) con,course_id
                        from stu_course
                        group by course_id)
                        sc
where sc.course_id=c.c_id
           AND con= (select max(COUNT(stu_id))
                                     from stu_course
                                     group by course_id);
--8.查询选了非本专业课程的学员的信息
SELECT distinct dd.*
FROM student dd,(SELECT stu_id,c_major
                            from stu_course t, course c
                             WHERE t.course_id=c.c_id) ff
WHERE ff.stu_id=dd.stu_id
            AND dd.stu_major<>ff.c_major;--麻烦

            select distinct s.*
            from student s,stu_course sc,course c
            where sc.course_id=c.c_id and sc.stu_id=s.stu_id
                       and s.stu_major<>c.c_major;

--9.查询所有课程全部不及格的学员的信息
select *
from  student s
where (SELECT max(score) FROM stu_course
              WHERE stu_id=s.stu_id
            group by s.stu_id)<60;
