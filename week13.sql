-- test2.sql 과 test6.sql을 합쳐 pack1 패키지를 작성해 보자.
 
-- 명세부  

create or replace procedure test10
(v_stu_no in student.stu_no%type)
is
v_stu_name student.stu_name%type;
begin
select stu_name
into v_stu_name
from student
where stu_no = v_stu_no;
dbms_output.put_line(v_stu_name);
exception
when no_data_found then
dbms_output.put_line('해당데이터가 없습니다.');
end test10;

exec test10(20213088)
exec test10(20213089)

create or replace procedure test11
(v_sub_no in enrol.sub_no%type)
is
v_cnt number;
cnt_error exception;
begin
select count(stu_no) into v_cnt from enrol
where sub_no = v_sub_no;
dbms_output.put_line(v_sub_no|| '과목수강자는' ||v_cnt|| '명입니다');
if v_cnt = 0 then
raise cnt_error;
end if;
exception
when cnt_error then
dbms_output.put_line('수강자가 없습니다');
end test11;

exec test11(102) 
exec test11(120) 

create or replace package pack1 is
procedure test2
(v_stu_no in student.stu_no%type,
v_stu_grade in student.stu_grade%type);
function test6
(v_enr_grade in number)
return char;
end;

--몸체부  
create or replace package body pack1 is
procedure test2
(v_stu_no in student.stu_no%type,
v_stu_grade in student.stu_grade%type)
is
begin
update student
set stu_grade = v_stu_grade
where stu_no = v_stu_no;
end test2;
 
function test6
(v_enr_grade in number)
return char
is
enr_score char;
begin
if v_enr_grade >= 90 then enr_score := 'A';
elsif v_enr_grade >= 80 then enr_score := 'B';
elsif v_enr_grade >= 70 then enr_score := 'C';
elsif v_enr_grade >= 60 then enr_score := 'D';
else enr_score := 'F';
end if;
return (enr_score);
end test6;
end;
------------------------------------------------------------------
-- 실행  
select * from student
where stu_no = 20213088;

exec pack1.test2(20213088,2)
--------------------------------------------------------------------------
select pack1.test6(85) from dual;
d_score
----------
B
 
-- 이름으로 학번 검색, 학번으로 이름 검색
-- 명세부  
create or replace package pack2 is
g_stu_dept varchar2(20);
procedure test12
(v_stu_no in student.stu_no%type);
procedure test12
(v_stu_name student.stu_name%type);
End;
-- 몸체부  
create or replace package body pack2 is
procedure test12
(v_stu_no in student.stu_no%type)
is
v_stu_name student.stu_name%type;
begin
select stu_name
into v_stu_name
from student
where stu_no= v_stu_no and stu_dept= g_stu_dept;
dbms_output.put_line(v_stu_name);
exception
when no_data_foundthen
dbms_output.put_line('컴퓨터정보과에학생이없습니다.');
end test12;
 
procedure test12
(v_stu_name in student.stu_name%type)
is
v_stu_no student.stu_no%type;
begin
select stu_no
into v_stu_no
from student
where stu_name= v_stu_name and stu_dept= g_stu_dept;
dbms_output.put_line(v_stu_no);
exception
when no_data_found then
dbms_output.put_line('컴퓨터정보과에학생이없습니다.');
end test12;
begin
g_stu_dept:= ‘컴퓨터정보’;
end;
-- 실행  
execute pack2.test12(20191001);
김종헌
execute pack2.test12('김종헌');
20191001
--  실습을 위해 TMP_TBL1 생성
create table tmp_tbl1
(userid varchar2(10),
 workdate date,
  bigo char(1));
  --학생 테이블에 변경작업이 일어날 때 동작하는 트리거 생성
create or replace trigger tri1
after update on student
begin
insert into tmp_tbl1
values(user, sysdate, 'U');
end tri1;
    -- 트리거 TRI1 실행
update student
set stu_weight = stu_weight * 0.9;
 
select *
from tmp_tbl1;
 
rollback;
----------------------------------------
-- 행단위 트리거
create or replace trigger tri2
after update on student
for each row
begin
insert into tmp_tbl1
values(user,sysdate, 'U');
end tri2;
-- 트리거2 실행 
update student
set stu_weight = stu_weight * 0.9;
 -- TMP_TBL1 테이블 확인
 select *
 from tmp_tbl1;
 
  ROLLBACK;
-- 조건에 의한 트리거
 
create or replace trigger tri3
after update on student
for each row
when (old.stu_weight > 70)
begin
insert into tmp_tbl1
values(user,sysdate, 'U');
end tri3;
 
select *
from student
where stu_weight > 70;
-- 트리거3 실행
 update student
 set stu_weight = stu_weight * 0.9;
 
-- TMP_TBL1 테이블 확인
 select *
 from tmp_tbl1;
 -- 실습을 위한 TMP_TBL2 생성
 create table tmp_tbl2
(u_id varchar2(10),
wdate date,
n_sub_no char(3),
n_stu_no varchar2(9),
n_enr_grade number(3),
o_sub_no char(3),
o_stu_no varchar2(9),
o_enr_grade number(3),
bigo char(1));
 
--LOG 파일을 생성하기 위한 트리거 TRI4
create or replace trigger tri4
after insert or update or delete on enrol
for each row
begin
if inserting then
insert into tmp_tbl2(u_id, wdate, n_sub_no, n_stu_no, n_enr_grade, bigo)
values(user, sysdate, :new.sub_no, :new.stu_no, :new.enr_grade, 'I');
elsif updating then
insert into tmp_tbl2(u_id, wdate, o_sub_no, o_stu_no, o_enr_grade, n_sub_no, n_stu_no, n_enr_grade, bigo)
values(user, sysdate, :old.sub_no, :old.stu_no, :old.enr_grade, :new.sub_no, :new.stu_no, :new.enr_grade, 'U');
elsif deleting then
insert into tmp_tbl2(u_id, wdate, o_sub_no, o_stu_no, o_enr_grade, bigo)
values(user, sysdate, :old.sub_no, :old.stu_no, :old.enr_grade, 'D');
end if;
end tri4;
 
-- LOG 파일을 생성하기 위한 트리거 실행
 
 insert into enrol
 values ('101', '20211062', 40);
 
select *
 from tmp_tbl2;
 
-- LOG 파일을 생성하기 위한 트리거 실행
update enrol
set enr_grade = 80
where sub_no = '101' and stu_no = '20211062';
 
select *
from tmp_tbl2;
 
-- LOG 파일을 생성하기 위한 트리거 실행 
 
delete from enrol
where sub_no = '101' and stu_no ='20211062';
 
select *
from tmp_tbl2;