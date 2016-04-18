load data infile '../data/images.dat'
insert into table images
fields terminated by "," optionally enclosed by '"'
(post_id,imageFileName)
