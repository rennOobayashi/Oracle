create table t_student(
 stu_no number(9),
 stu_name varchar2(12),
 stu_birth date,
 stu_dept varchar2(20),
 stu_grade number(1),
 stu_class char(1),
 stu_gender char(1),
 stu_height number(5,2),
 stu_weight number(5,2));
  
desc t_student;

select * from t_student;

drop table t_student;
create table t_student
    as select * from student where stu_dept = '기계';
    
desc t_student;

select * from t_student;

alter table t_student
    add(army char(1)); 
    
desc t_student;

select * from t_student;

alter table t_student
    modify(army number);

desc t_student;

select * from t_student;
    
alter table t_student
    drop(army);

desc t_student;

select * from t_student;
    
rename t_student to test_student;

desc t_student;

desc test_student;


truncate table test_student;
select * from test_student;
rollback

select *
from test_student;

drop table test_student;

desc test_student;

create table t_student(
 stu_no number(9),
 stu_name varchar2(12),
 stu_birth date,
 stu_dept varchar2(20)
 constraint n_stu_dept not null,
 stu_grade number(1),
 stu_class char(1),
 stu_gender char(1),
 stu_height number(5,2),
 stu_weight number(5,2)); 
 
create table t_student(
 stu_no number(9),
 stu_name varchar2(12)
 constraint u_stu_name unique,
 stu_birth date,
 stu_dept varchar2(20)
 constraint n_stu_dept not null,
 stu_grade number(1),
 stu_class char(1),
 stu_gender char(1),
 stu_height number(5,2),
 stu_weight number(5,2)); 

create table t_student(
 stu_no number(9),
 stu_name varchar2(12)
 constraint u_stu_name unique,
 stu_birth date,
 stu_dept varchar2(20)
 constraint n_stu_dept not null,
 stu_grade number(1),
 stu_class char(1),
 stu_gender char(1),
 stu_height number(5,2),
 stu_weight number(5,2),
 constraint p_stu_no primary key(stu_no));

create table t_enrol(
 sub_no char(3),
 stu_no number(9),
 enr_grade number(3),
 constraint p_enol primary key(sub_no,stu_no));
 
create table t_enrol(
 sub_no char(3),
 stu_no number(9),
 enr_grade number(3),
 constraint enr_sub_no_fk1 foreign key(sub_no)
 references subject(sub_no),
 constraint enr_stu_no_fk2 foreign key(stu_no)
 references student(stu_no),
 constraint p_enol primary key(sub_no,stu_no));
 
create table t_student(
 stu_no number(9),
 stu_name varchar2(12)
 constraint u_stu_name unique,
 stu_birth date,
 stu_dept varchar2(20)
 constraint n_stu_dept not null,
 stu_grade number(1),
 constraint c_stu_grade check (stu_grade in(1, 2, 3)),
 stu_class char(1),
 stu_gender char(1),
 stu_height number(5,2),
 stu_weight number(5,2),
 constraint p_stu_no primary key(stu_no));
 
select *
 from user_constraints
 where table_name = 'T_STUDENT';
 
select *
 from user_constraints
 where table_name = 'T_ENROL';
 
alter table t_enrol
 drop constraint f_enr_sub_no;
 
alter table t_student
 disable constraint n_stu_dept;
 
alter table t_student
 enable constraint n_stu_dept;
 
create or replace view v_student1
 as select * from student where stu_dept = '컴퓨터정보';
 
select *
 from v_student1;
 
create or replace view v_student1
 as select * from student where stu_dept = '컴퓨터정보';


select * from v_student1 where stu_dept ='컴퓨터정보'  and stu_grade = 2;

create or replace view v_enrol1
 as select sub_name, a.sub_no, stu_no, enr_grade
 from enrol a, subject b
 where a.sub_no = b.sub_no;
 
select * from v_enrol1;

select stu_no, stu_name, a.stu_dept, stu_height
 from student a,(select stu_dept, avg(stu_height) as avg_height
 from student
 group by stu_dept) b
 where a.stu_dept = b.stu_dept
 and a.stu_height > b.avg_height;

select stu_no, stu_name, stu_height
 from (select stu_no, stu_name, stu_height
 from student
 where stu_height is not null
 order by stu_height desc)
 where rownum <= 5;
 