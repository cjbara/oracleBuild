drop table buyer_ratings cascade constraints;
drop table seller_ratings cascade constraints;

create table buyer_ratings (
	rater_id number(10),
	buyer_id number(10),
	rating number(2) not null,
	primary key (rater_id, buyer_id),
	foreign key (buyer_id) references users(user_id),
	foreign key (rater_id) references users(user_id));

create table seller_ratings (
	rater_id number(10),
	seller_id number(10),
	rating number(2) not null,
	primary key (rater_id, seller_id),
	foreign key (seller_id) references users(user_id),
	foreign key (rater_id) references users(user_id));
