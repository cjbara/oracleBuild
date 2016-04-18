drop table categories cascade constraints;

create table categories (
	category_id number(5) primary key,
	category varchar(30) not null,
	created_by number(10) not null);

drop sequence category_id_seq;
create sequence category_id_seq;

create or replace trigger category_id_trig
before insert on categories
for each row

begin
  select category_id_seq.NEXTVAL
  into :new.category_id
  from dual;
end;
/
