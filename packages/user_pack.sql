create or replace package user_pack
is
  procedure check_login (id OUT users.user_id%type, e IN users.email%type, pw IN users.password%type);
  procedure new_user (id OUT users.user_id%type, e IN users.email%type, pw IN users.password%type, firstname IN users.fname%type, lastname IN users.lname%type, phone IN users.phonenumber%type);

  procedure update_email(id users.user_id%type, new_email users.email%type);
  procedure update_password(id users.user_id%type, new_password users.password%type);
  procedure update_fname(id users.user_id%type, new_fname users.fname%type);
  procedure update_lname(id users.user_id%type, new_lname users.lname%type);
  procedure update_phone(id users.user_id%type, new_phone users.phonenumber%type);

  procedure get_user_info(id IN users.user_id%type, info OUT sys_refcursor);

end user_pack;
/
