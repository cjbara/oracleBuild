load data infile '../data/posts.dat'
insert into table posts
fields terminated by "," optionally enclosed by '"'
(user_id,price,free,title,description,category_id,location,orBestOffer,sold)
