load data infile '../data/messages.dat'
insert into table messages
fields terminated by "," optionally enclosed by '"'
(sender_id,receiver_id,text,read)
