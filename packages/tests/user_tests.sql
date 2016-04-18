declare
  id users.user_id%type;
  email users.email%type;
  fname users.fname%type;
  lname users.lname%type;
  phone users.phonenumber%type;
begin
--=== Tests check_login ===
  users_pack.check_login(id, 'cjbara@nd.edu', 'pw');
  if id = 1 then
    dbms_output.put_line('Check login gets user_id for valid email/password');
  end if;
  users_pack.check_login(id, 'cjbara@nd.edu', 'pass') ;
  if id = -1 then
    dbms_output.put_line('Check login gets -1 for invalid email/password');
  end if;

--=== Tests add_new_user ===
  /*users_pack.new_user(id, 'cjbara@gmail.com', 'p', 'CJ', 'Jab', 2485205806);
  dbms_output.put_line('new id = ' || id);*/

--=== Tests update ===
  --users_pack.update_password(5, 'password');

--=== Tests get user info
  users_pack.get_user_info(1, email, fname, lname, phone);
  dbms_output.put_line(fname || ' ' || lname || ' has email: '||email || ' and phone: ' || phone);

end;
/
