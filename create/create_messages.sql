drop table messages cascade constraints;

create table messages (
	message_id number(15) primary key,
	sender_id number(10) not null,
	receiver_id number(10) not null,
	text varchar(140) not null,
	read number(1) default 0,
	timestamp timestamp default current_timestamp,
	foreign key (sender_id) references users(user_id),
	foreign key (receiver_id) references users(user_id));

drop sequence message_id_seq;
create sequence message_id_seq;

create or replace trigger message_id_trig
before insert on messages
for each row

begin
  select message_id_seq.NEXTVAL
  into :new.message_id
  from dual;
end;
/
