drop table users cascade constraints;

create table users (
	user_id number(10) primary key,
	email varchar(30) not null,
	password varchar(50) not null,
	fname varchar(20) not null,
	lname varchar(30) not null,
	phoneNumber varchar(12) null );

drop sequence user_id_seq;
create sequence user_id_seq;

create or replace trigger user_id_trig
before insert on users
for each row

begin
  select user_id_seq.NEXTVAL
  into :new.user_id
  from dual;
end;
/
