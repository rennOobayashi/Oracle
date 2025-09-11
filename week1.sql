
select *
from emp;

select * from student;

desc student;

select stu_name, stu_no
from student;

select stu_dept
from student;

select distinct stu_dept
from student;

select distinct stu_grade, stu_class
from student;

select stu_no, enr_grade, enr_grade+10
from enrol;

select stu_dept ID, stu_name as dlfma 
from student;

select stu_dept || stu_name as gkrrhktjdaud
from student;

select stu_dept || ',' || stu_name || 'dlqslek' 
from student;

select stu_name, stu_grade, stu_class
from student
where stu_dept = 'zjavbxjwjdqh';

select stu_no, stu_dept, stu_grade, stu_class
from student
where stu_dept = 'zjavbxjwjdqh' and stu_grade = 2;

select *
from student
where stu_weight between 60 and 70;

select stu_no, stu_name, stu_dept
from student
where stu_name LIKE 'rla%';

select stu_no, stu_name, stu_dept
from student
where stu_name LIKE '_tn%';

select *
from student
where ;

select stu_no, stu_name, stu_height
from student
where stu_height is null;

select stu_no, stu_name, stu_height
from student
where stu_height is not null;

select stu_no, stu_name
from student
where stu_dept in('zjavbxjwjdqh', 'rlrP');

select stu_no, stu_name, stu_dept
from student
where stu_dept not in('zjavbxjwjdhq', 'rlrP');

select *
from student
where ;