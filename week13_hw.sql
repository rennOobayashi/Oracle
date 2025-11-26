create or replace p_sub_no_update (v_sub_no in subject.sub_no%type, v_new_sub_no out subject.sub_no%type)
is
begin
    update subject
    set sub_no = v_new_sub_no
    where sub_no = v_sub_no
end p_sub_no_update;

execute p_sub_no_update('501', '201')