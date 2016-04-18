create or replace package body user_pack
is
--====== Checks a login based on a given username and password returns -1 if not valid or user_id if valid ======
  procedure check_login (id OUT users.user_id%type, e IN users.email%type, pw IN users.password%type)
  is begin
    select u.user_id
    into id
    from users u
    where u.email = e
    and u.password = pw;
  exception
    when no_data_found then
      id := -1;
    when too_many_rows then
      id := -1;
  end;

--====== Adds a new user with given parameters and returns the new user_id ======
  procedure new_user (id OUT users.user_id%type, e IN users.email%type, pw IN users.password%type, firstname IN users.fname%type, lastname IN users.lname%type, phone IN users.phonenumber%type)
  is
  begin
    insert into users (email, password, fname, lname, phonenumber)
    values (e, pw, firstname, lastname, phone);
    id := user_id_seq.currval;
  end; 

--====== Updates attributes for user_id ======
  procedure update_email(id users.user_id%type, new_email users.email%type)
  is begin
    update users
    set email = new_email
    where user_id = id;
  end;

  procedure update_password(id users.user_id%type, new_password users.password%type)
  is begin
    update users
    set password = new_password
    where user_id = id;
  end;

  procedure update_fname(id users.user_id%type, new_fname users.fname%type)
  is begin
    update users
    set fname = new_fname
    where user_id = id;
  end;

  procedure update_lname(id users.user_id%type, new_lname users.lname%type)
  is begin
    update users
    set lname = new_lname
    where user_id = id;
  end;

  procedure update_phone(id users.user_id%type, new_phone users.phonenumber%type)
  is begin
    update users
    set phonenumber = new_phone
    where user_id = id;
  end;

  procedure get_user_info(id IN users.user_id%type, info OUT sys_refcursor)
  is begin
    open info for
    select user_id, email, fname, lname, phonenumber
    from users
    where user_id = id;
  end;

end user_pack;
/
