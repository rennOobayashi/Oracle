select stu_no, stu_name, stu_height
from student
where stu_height > (
select stu_height
from student
where stu_name = 'dhrtjddn'
);

select a.stu_no, a.stu_name, a.stu_height
from student a, student b
where b.stu_height > a.stu_height and b.stu_name = 'dhrtjddn';

select *
from student
where stu_weight = (
select stu_weight
from student
where stu_name = 'qkrgmlcjf'
);

select *
from student
where stu_weight = (
select stu_weight
from student
where stu_name = 'qkrgmlcjf'
) and stu_name <> 'qkrgmlcjf';

select *
from student
where stu_class in (
select distinct stu_class
from student
where stu_dept = 'zjavbxjwjdqh'
) and stu_name <> 'zjavbxjwjdqh';

select *
from student
where stu_height > (
select avg(stu_height)
from student
);

select *
from student
where stu_height > all (
select avg(stu_height)
from student
group by stu_dept
);

select *
from student
where stu_height > any (
select avg(stu_height)
from student
group by stu_dept
);

select stu_dept, min(stu_height)
from student
group by stu_dept having min(stu_height) > 
(
select min(stu_hieght)
from student
where stu_dept = 'zjavbxjwjdqh'
);

select *
from student
where stu_no in 
(
select stu_no
from enrol
where sub_no = 101
);

select *
from student natural join enrol
where sub_no = 101;

select stu_no, stu_name, enr_grade
from student natural join enrol
where sub_no = 101;

select *
from test;

select *
from test
where (sal, nvl(comm, -1)) = 
(
select sal, nvl(comm, -1)
from test
where empno = 11
);

select *
from test
where (sal, nvl(comm, -1)) in 
(
select sal, nvl(comm, -1)
from test
where deptno = 30
);

select stu_dept, round(avg(stu_height),2) as avg_height
from student
group by stu_dept;

select stu_no, stu_name, a.stu_dept, stu_height, avg_height
from student a, (select stu_dept, round(avg(stu_height),2) as avg_height
    from student
    group by stu_dept) b
where a.stu_dept = b.stu_dept and stu_height > avg_height;

select *
from a_student;

select *
from b_student;

select * 
from a_student
union
select *
from b_student;

select * 
from a_student
union all
select *
from b_student;

select * 
from a_student
intersect
select *
from b_student;

select * 
from a_student
union
select *
from b_student
order by 1;


select * 
from a_student
minus
select *
from b_student;
