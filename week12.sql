create or replace procedure test2
    (v_stu_no in student.stu_no%type,
     v_stu_grade in student.stu_grade%type)
 is
 begin
    update student
        set stu_grade = v_stu_grade
        where stu_no = v_stu_no;
end test2;
 
 
select *
from student
where stu_no = 20213075;
 
exec test2(20213075,2);

create or replace procedure test3
    (v_stu_no in student.stu_no%type,
     v_stu_name out student.stu_name%type)
 is
 begin
    select stu_name
    into v_stu_name
    from student
    where stu_no = v_stu_no;
end test3;
 
 
variable d_stu_name varchar2(12)
 
exec test3(20213075,:d_stu_name);
 
print d_stu_name;

create or replace procedure test4
  (v_sub_no in enrol.sub_no%type,
   v_stu_no in enrol.stu_no%type,
   v_enr_grade in out enrol.enr_grade%type)
 is
 begin
  update enrol
    set enr_grade = enr_grade + v_enr_grade
    where stu_no = v_stu_no
    and sub_no = v_sub_no;
 
    select enr_grade
           into v_enr_grade
           from enrol
           where stu_no = v_stu_no
           and sub_no = v_sub_no;
 
end test4;
 
variable d_enr_grade number
begin :d_enr_grade := 10; end;

exec test4(101,20191001,:d_enr_grade);
 
print d_enr_grade;

drop sequence SEQ1;
 
create sequence seq1
    increment by 1
    start with 201
    maxvalue 999;
 
create or replace procedure test5
  (v_sub_name in subject.sub_name%type,
   v_sub_prof in subject.sub_prof%type,
   v_sub_grade in subject.sub_grade%type,
   v_sub_dept in subject.sub_dept%type)
 is
 begin
  insert into subject
    values(seq1.nextval, v_sub_name, 
            v_sub_prof, v_sub_grade, v_sub_dept);
  commit;
 
end test5;
 
 
select * from subject order by 1;
 
exec test5('앱','홍길동',3,'컴퓨터정보');
 
exec test5('웹', '홍길동', 3, '컴퓨터정보');

create or replace function test6
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
  
variable d_score char;

execute :d_score := test6(95);
 
print d_score;

select enr_grade, test6(enr_grade) as score
from enrol
where stu_no = 20213075;
 
create or replace procedure test7
 is
   v_stu_no enrol.stu_no%type;
   v_sub_no enrol.sub_no%type;
   v_enr_grade enrol.enr_grade%type;
   cursor t_cursor is
     select stu_no, sub_no, enr_grade
     from enrol
     where sub_no = 101;
 
 begin
  open t_cursor;
  loop
    fetch t_cursor into v_stu_no, v_sub_no, v_enr_grade;
    exit when t_cursor%NOTFOUND;
    dbms_output.put_line(v_stu_no||'='||v_sub_no||'='||v_enr_grade);
  end loop;
  close t_cursor;
end test7;
  
execute test7
 
create or replace procedure test8
 is
  v_enrol enrol%rowtype;
  cursor t_cursor is
    select stu_no, sub_no, enr_grade
      from enrol
      where sub_no = 101;
 begin
  for v_enrol in t_cursor loop
    exit when t_cursor%NOTFOUND;
    dbms_output.put_line(v_enrol.stu_no||'=='||v_enrol.sub_no
                           ||'='||v_enrol.enr_grade);
    end loop;
end test8;
 
execute test8
 
create or replace procedure test9
  (v_sub_no in enrol.sub_no%type)
 is
  v_stu_no enrol.stu_no%type;
  v_enr_grade enrol.enr_grade%type;
  cursor t_cursor(v_sub_no number) is
    select student.stu_no, enr_grade
      from student, enrol
      where student.stu_no = enrol.stu_no
      and enrol.sub_no = v_sub_no;
 begin
  open t_cursor(v_sub_no);
  loop
    fetch t_cursor into v_stu_no, v_enr_grade;
    exit when t_cursor%NOTFOUND;
    dbms_output.put_line(v_stu_no||'=='||v_enr_grade);
  end loop;
 close t_cursor;
end test9;
 
exec test9(101);
 
exec test9(102);
 
exec test9(105);
 
exec test9(107);
 