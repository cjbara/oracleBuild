load data infile '../data/categories.dat'
insert into table categories
fields terminated by "," optionally enclosed by '"'
(category, created_by)
