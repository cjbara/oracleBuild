drop table images cascade constraints;

create table images (
	image_id number(15) primary key,
	post_id number(15) not null,
	image blob not null,
	foreign key (post_id) references posts(post_id));

drop sequence image_id_seq;
create sequence image_id_seq;

create or replace trigger image_id_trig
before insert on images
for each row

begin
  select image_id_seq.NEXTVAL
  into :new.image_id
  from dual;
end;
/
