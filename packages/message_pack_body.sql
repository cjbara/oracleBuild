create or replace package body message_pack
is
  procedure get_message_conversation(messages OUT sys_refcursor, id1 IN messages.sender_id%type)
  is begin
    open messages for
    select sender, u.fname||' '||u.lname as receiver, a.sender_id, a.receiver_id, a.text, TO_CHAR(a.timestamp, 'DAYMON DD')||' at '||TO_CHAR(a.timestamp, 'HH:MI PM') timestamp, a.read
    from
      (select u.fname||' '||u.lname as sender, a.sender_id, a.receiver_id, a.text, a.timestamp, a.read
      from 
        (
        select * from messages
        where message_id in 
        (select max(message_id) from (
        select * from
          (select m.receiver_id userid, m.sender_id otherid, m.message_id
          from messages m
          where m.receiver_id = id1)
         union
          (select m.sender_id userid, m.receiver_id otherid, m.message_id
          from messages m
          where m.sender_id = id1)
         )
         group by otherid
        )
    ) a, 
      users u
      where a.sender_id = u.user_id
      ) a,
    users u
    where a.receiver_id = u.user_id
    order by timestamp desc;
  end;

  procedure send_message(id OUT messages.message_id%type, senderid IN messages.sender_id%type, receiverid IN messages.receiver_id%type, txt IN messages.text%type)
  is begin
    insert into messages (sender_id, receiver_id, text)
    values (senderid, receiverid, txt);
    id := message_id_seq.currval;
  end;

  procedure mark_conversation_as_read(viewer messages.sender_id%type, other messages.sender_id%type)
  is begin
    update messages
    set read = 1
    where receiver_id = viewer
    and sender_id = other;
  end;

  procedure get_messages_between_users(messages OUT sys_refcursor, id1 IN messages.sender_id%type, id2 IN messages.sender_id%type)
  is begin
    message_pack.mark_conversation_as_read(id2, id1);
    open messages for
    select sender, u.fname||' '||u.lname as receiver, a.text, TO_CHAR(a.timestamp, 'DAYMON DD')||' at '||TO_CHAR(a.timestamp, 'HH:MI PM') timestamp, a.read
    from
      (select u.fname||' '||u.lname as sender, a.receiver_id, a.text, a.timestamp, a.read
      from
        (select * from
          (select m.sender_id, m.receiver_id, m.text, m.timestamp, m.read
          from messages m
          where m.sender_id = id1 and m.receiver_id = id2)
         union
          (select m.sender_id, m.receiver_id, m.text, m.timestamp, m.read
          from messages m
          where m.sender_id = id2 and m.receiver_id = id1)
        ) a,
      users u
      where a.sender_id = u.user_id
      ) a,
    users u
    where a.receiver_id = u.user_id
    order by timestamp;
  end;

end message_pack;
/
