create table a_student
as select *
from student
where stu_dept in ('기계', '전기전자') ;

create table b_student
as select *
from student
where stu_dept in ('기계', '전기전자') ;

select *
from a_student;

select *
from b_student;

delete from b_student;

select *
from b_student;

rollback; 

select *
from b_student;
