select *
from a_student;

insert 
into a_student(stu_no, stu_name)
values(20, 'dl');

select *
from a_student;

select *
from a_student;

delete from a_student
where stu_no = 20213088;

update a_student
set stu_weight = 165
where stu_no = 20213088;

update a_student
set stu_grade = 2
where stu_no = 20213075;
