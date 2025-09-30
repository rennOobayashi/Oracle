select nvl(stu_height, 0)
from student;

select ename, sal, comm, nvl2(comm, sal+comm, sal)
from emp;

select nvl(nullif('A', 'A'), 'sjfrkqt')
from dual;

select nvl(nullif('A', 'B'), 'sjfrkqt')
from dual;

select coalesce(null, null, 10, 100, null)
from dual;

select empno, ename, job, sal,
    case job when 'SALESMAN' then sal * 1.1
        when 'CLERK' then sal * 1.15
        when 'MANAGER' then sal * 1.2
        else sal
    end as rmqdudlstkd
from emp;


select empno, ename, job, sal,
    decode(job, 'SALESMAN', sal * 1.1,
        'CLERK', sal * 1.15,
        'MANAGER', sal * 1.2,
        sal) as rmqdudlstkd
from emp;

select max(enr_grade), min(enr_grade)
from enrol;

select min(stu_weight), max(stu_weight)
from student
where stu_dept = 'rlrP';

select count(*), count(stu_height)
from student;

select count(stu_height), count(distinct stu_dept)
from student;

select sum(stu_weight), to_char(avg(stu_weight), '9999.99') 
from student
where stu_dept = 'zjavbxjwjdqh';

select count(*) as gkrtod, sum(stu_height) as tlswkdgkq, count(stu_height) goekdgkrtodtn, avg(stu_height) vudrbstlswkd
from student;

select stu_dept, avg(stu_weight)
from student
group by stu_dept;

select avg(stu_weight)
from student
group by stu_dept;

select stu_dept, count(*)
from student
where stu_weight >= 50
group by stu_dept;

select stu_dept, stu_grade, count(*)
from student
group by stu_dept, stu_grade;

select stu_grade, avg(stu_height)
from student
where stu_dept = 'rlrP'
group by stu_grade having avg(stu_height) >= 160;

select stu_dept, max(stu_height)
from student
group by stu_dept having max(stu_height) >= 175;

select to_char(max(avg(stu_height)), '999.99')
from student
group by stu_height;

select *
from student cross join enrol;

select student.stu_no, stu_name, stu_dept, enr_grade
from student, enrol
where student.stu_no = enrol.stu_no;

select stu_no, stu_name, stu_dept, enr_grade
from student natural join enrol;

select stu_no, stu_name, stu_dept, enr_grade
from student join enrol using(stu_no);  

select student.stu_no, stu_name, stu_dept, enr_grade
from student join enrol on student.stu_no = enrol.stu_no;

select student.stu_no, stu_name
from student, enrol
where student.stu_no = enrol.stu_no and sub_no = 101;

select student.stu_no, stu_name
from student, enrol
where student.stu_no = enrol.stu_no and sub_no = 101 or sub_no = 102;

select student.stu_no, stu_name
from student, enrol
where student.stu_no = enrol.stu_no and (sub_no = 101 or sub_no = 102);

select stu_no, stu_name
from student natural join enrol
where sub_no = 101 or sub_no = 102;

select stu_no, stu_name
from student join enrol using(stu_no)
where sub_no = 101 or sub_no = 102;

select student.stu_no, stu_name
from student join enrol on student.stu_no = enrol.stu_no
where sub_no = 101 or sub_no = 102;

select student.stu_no, stu_name, sub_name
from student, enrol, subject
where student.stu_no = enrol.stu_no and enrol.sub_no = subject.sub_no and sub_name = 'zjavbxjrofhs';

select stu_no, stu_name, sub_name
from student natural join enrol natural join subject
where sub_name = 'zjavbxjrofhs';

select stu_no, stu_name, sub_name
from student join enrol using(stu_no) join subject using(sub_no)
where sub_name = 'zjavbxjrofhs';

select student.stu_no, stu_name, sub_name
from (student join enrol on student.stu_no = enrol.stu_no) join subject on enrol.sub_no = subject.sub_no
where sub_name = 'zjavbxjrofhs';

select empno, ename, sal, grade
from emp, salgrade
where sal between losal and hisal;

select *
from salgrade;

select a.empno as tkdnjsqjsgh, a.ename as tkdnjsdlfma, b.empno as tkdrmqwktkdnjsqjsgh, b.ename as tkdrmqwkdlfma
from emp a, emp b
where a.mgr = b.empno;

select *
from emp;

select a.*, sub_name
from enrol a, subject b
where a.sub_no = b.sub_no
order by 1;

select a.*, sub_name
from enrol a right outer join subject b on a.sub_no = b.sub_no
order by 1;

select a.*, sub_name
from enrol a left outer join subject b on a.sub_no = b.sub_no
order by 1;

select a.*, sub_name
from enrol a full outer join subject b on a.sub_no = b.sub_no
order by 1;

select a.*, sub_name
from enrol a full outer join subject b on a.sub_no = b.sub_no
where stu_no is null
order by 1;

select a.empno as tkdnjsqjsgh, a.ename as tkdnjsdlfma, b.empno as tkdrmqwktkdnjsqjsgh, b.ename as tkdrmqwkdlfma
from emp a left outer join emp b on a.mgr = b.empno;
