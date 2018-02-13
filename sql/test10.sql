--创建课程表 courses
--courid 课程编号 数字型
--cname 课程名 文字型 64位 可变字符串类型
--score 学分，数字型

create table courses (
  courid number,
  cname varchar2(64),
  score number
);

--  1001 java 2
--  1002 oracle 2

insert into course (
1001,java,1
),(1002,Oracle,2);

--  创建列ctime 类型date
alter table courses add column ctime date;

  --1001 ，1002 ctime 数据 sysdate
  update courses
    set ctime =sysdate;
