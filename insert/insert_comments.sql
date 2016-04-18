load data infile '../data/comments.dat'
insert into table comments
fields terminated by "," optionally enclosed by '"'
(user_id,post_id,text,anonymous)
