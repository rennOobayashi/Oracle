SQL> create index i_stu_name on student(stu_name);
 
SQL> create index i_stu_no_name on student(stu_no, stu_name);
 
SQL> create unique index i_stu_name on student(stu_name);
 
SQL> create index i_stu_weight on student(stu_weight-5);
 
 
SQL> select * from user_indexes
where table_name = 'STUDENT';
 
SQL> drop index i_stu_name;
 
select seq1.nextval from dual;
run
select seq.nextval from dual;
 
SQL> create sequence seq1
increment by 2
start with 1000
maxvalue 10000;

create or replace procedure test1
(v_sub_name in varchar2,
v_sub_prof in varchar2,
v_sub_grade in number,
v_sub_dept in varchar2)
is
v_sub_no char(3);
begin
select max(sub_no)
  into v_sub_no
  from subject;
v_sub_no := to_number(v_sub_no) + 1;
insert into subject
  values(v_sub_no, v_sub_name, v_sub_prof, v_sub_grade,v_sub_dept);
commit;
end test1;
/
 
 
 @test1.sql
 execute  test1('zjavbxjrnwh','rkdwnqhd',2, 'zjavbxjwjdqh');
 
 
SQL> set serveroutput on
declare
v_condition number := 1;
begin
if v_condition = 1 then
  dbms_output.put_line('eogks');    
end if;
end;
/
 
set serveroutput on
declare
v_condition number := 1;
begin
if v_condition = 1 then
  dbms_output.put_line('eogks');  
else
  dbms_output.put_line('alsrnr');      
end if;
end;
/
 
 
set serveroutput on
declare
v_condition number := 2;
begin
if v_condition < 1 then
 dbms_output.put_line('eogks');  
elsif v_condition = 1 then
 dbms_output.put_line('alsrnr');
else
 dbms_output.put_line('aksto');      
end if;
end;
/
 
 
declare
v_cnt number := 0;
v_sum number := 0;
begin
loop
 v_cnt := v_cnt +1;
 v_sum := v_sum + v_cnt;
 dbms_output.put_line(v_cnt|| ' ' ||v_sum);
 exit when v_cnt = 10;
end loop;
end;
/
 
 
declare
v_cnt number;
v_sum number := 0;
begin
for v_cnt in  1..10  loop
  v_sum := v_sum + v_cnt;
  dbms_output.put_line(v_cnt|| ' ' ||v_sum);
end loop;
end;
/
 
declare
v_cnt number := 0;
v_sum number := 0;
begin
while v_cnt <= 10 loop
  v_cnt := v_cnt + 1;
  v_sum := v_sum + v_cnt;
  dbms_output.put_line(v_cnt|| ' ' ||v_sum);
end loop;
end;
/
 
SELECT stu_name
INTO v_stu_name
FROM student
WHERE stu_no =  v_stu_no;
 
UPDATE student
SET stu_name = v_stu_name, stu_grade= v_stu_grade
WHERE stu_no =  v_stu_no;
 
INSERT INTO subject
VALUES(v_sub_no, v_sub_name, v_sub_prof,
v_sub_grade, _sub_dept);
 
DELETE
FROM student    
WHERE stu_no = v_stu_no;
