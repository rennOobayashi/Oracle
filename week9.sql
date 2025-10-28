drop table a_enrol;

//NO RUN
create table a_enrol
     as select *
     from enrol
     where stu_no > 2021000;
     
//NO RUN
create table a_enrol_before
     as select *
     from enrol
     where stu_no > 2021000;

desc a_enrol;

select *
from a_enrol;

insert into a_enrol(sub_no, stu_no, enr_grade)
values (108, 20211062, 92);

select *
from a_enrol;

insert into a_enrol(sub_no, stu_no)
values (108, 20212088);

select *
from a_enrol;

insert into a_enrol(sub_no, stu_no, enr_grade)
values (108, 20212088, null);

select *
from a_enrol;

insert into a_enrol
select * from enrol
where stu_no like '2021%';

select *
from a_enrol;

update a_enrol
set enr_grade = enr_grade + 5;

select *
from a_enrol;

update a_enrol
set enr_grade = enr_grade + 10
where sub_no = 104;

select *
from a_enrol;

update a_enrol
set enr_grade = enr_grade + 10
where sub_no =  (select sub_no
from subject
where sub_name = 'tltmxpaqnstjrtjfrP');

select *
from a_enrol;

delete from a_enrol
where stu_no = 20191001;

select *
from a_enrol;

delete from a_enrol
where sub_no = (select sub_no
from subject
where sub_name = 'rlrPdythtjfrP');

select *
from a_enrol;

delete from a_enrol
where stu_no = 20191001;

select *
from a_enrol;

delete from a_enorl;

merge into a_student a
using student s
on (s.stu_no = a.stu_no)
when matched then
    update set a.stu_weight = s.stu_weight
when not matched then 
    insert values(s.stu_no, s.stu_name, s.stu_dept, null, null, null, null, s.stu_weight);

select *
from a_student;

