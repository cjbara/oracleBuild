drop table comments cascade constraints;

create table comments (
	comment_id number(20) not null,
	user_id number(10) not null,
	post_id number(15) not null,
	text varchar(140) not null,
	anonymous number(1),
	timestamp timestamp default current_timestamp,
	foreign key (user_id) references users(user_id),
	foreign key (post_id) references posts(post_id));
	
drop sequence comment_id_seq;	
create sequence comment_id_seq;	

create or replace trigger comment_id_trig
before insert on comments
for each row

begin
  select comment_id_seq.NEXTVAL
  into :new.comment_id
  from dual;
end;
/
