select sender, u.fname||' '||u.lname as receiver, a.text, a.timestamp
from
  (select u.fname||' '||u.lname as sender, a.receiver_id, a.text, a.timestamp
  from 
    (select * from
      (select m.sender_id, m.receiver_id, m.text, m.timestamp
      from messages m
      where m.sender_id = 2 and m.receiver_id = 4)
     union
      (select m.sender_id, m.receiver_id, m.text, m.timestamp
      from messages m
      where m.sender_id = 4 and m.receiver_id = 2)
    ) a, 
  users u
  where a.sender_id = u.user_id
  ) a,
users u
where a.receiver_id = u.user_id
order by timestamp desc
;
