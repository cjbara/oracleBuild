load data infile '../data/users.dat'
insert into table users
fields terminated by "," optionally enclosed by '"'
(email,password,fname,lname,phoneNumber)
