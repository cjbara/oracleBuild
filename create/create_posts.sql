drop table posts cascade constraints;

create table posts (
	post_id number(15) primary key, 
	user_id number(10) not null, 
	price float null,
	free number(1) null, 
	title varchar(30) not null, 
	description varchar(140) null, 
	category_id number(5) not null, 
	location varchar(50) null, 
	orBestOffer number(1) null, 
	sold number(1) default 0, 
	timestamp timestamp default current_timestamp,
	foreign key (user_id) references users(user_id),
	foreign key (category_id) references categories(category_id));

drop sequence post_id_seq;
create sequence post_id_seq;

create or replace trigger post_id_trig
before insert on posts
for each row

begin
  select post_id_seq.NEXTVAL
  into :new.post_id
  from dual;
end;
/
