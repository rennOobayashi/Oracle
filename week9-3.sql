select *
from a_student;

insert 
into a_student(stu_no, stu_name)
values(10, 'ghd');

select *
from a_student;

commit;

alter table a_student
add constraints pk_a_student primary key(stu_no);

select *
from a_student;

insert 
into a_student(stu_no, stu_name)
values(20, 'rla');

select *
from a_student;

commit;

select *
from a_student;

update a_student
set stu_class = 'C'
where stu_no = 20213088;

select *
from a_student;

commit;

select *
from a_student 
where stu_no = 20213088
for update;

commit;

update a_student
set stu_weight = stu_weight - 5;

commit;
