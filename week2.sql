select stu_no, stu_name
from student
order by stu_no;

select stu_no, stu_name
from student
order by stu_no desc;

select stu_no, stu_name, stu_dept, stu_weight - 5 as target
from student
order by target;

select stu_no, stu_name, stu_dept, stu_weight - 5 as target
from student
order by 4;

select stu_no, stu_name, stu_dept, stu_weight - 5 as target
from student
order by stu_weight - 5;

select stu_no, stu_name, stu_dept, stu_weight - 5 as target
from student
order by stu_dept, target;

select stu_no, stu_name, stu_dept, stu_weight - 5 as target
from student
order by stu_dept, stu_weight - 5 desc;

select stu_no, stu_name, stu_dept, stu_weight - 5 as target
from student
order by stu_height;

select stu_no, stu_name, stu_dept, stu_weight - 5 as target, stu_height
from student
order by stu_height;

select round(345.678), round(345.678, 0), round(345.678, 1), round(345.678, -1)
from dual;

select *
from dual;

select round(345.678), round(345.678, 0), round(345.678, 1), round(345.678, -1)
from emp;

select upper('korea')
from dual;

select initcap(ename)
from emp;

select sysdate
from dual;

select next_day(sysdate, 'FRI')
from dual;

select next_day(sysdate, 6)
from dual;

select round(sysdate, 'MON')
from dual;

select round(sysdate, 'MON')
from dual;

select empno, ename, to_char(hiredate, 'yyyy-mm') as dlqtksusdnjf 
from emp; 

select to_char(to_number(1234.5678), '9999.999')
from dual;

select to_char(to_number(1234.5678), '999.999')
from dual;


select empno, ename
from emp
where hiredate = to_date('1980-12-17', 'yy-mm-dd');

select empno, ename
from emp
where hiredate = '1980-12-17';

