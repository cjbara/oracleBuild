create or replace package body message_pack
is
  procedure send_message(id OUT messages.message_id%type, senderid IN messages.sender_id%type, receiverid IN messages.receiver_id%type, txt IN messages.text%type)
  is begin
    insert into messages (sender_id, receiver_id, text)
    values (senderid, receiverid, txt);
    id := message_id_seq.currval;
  end;

  procedure mark_message(id messages.message_id%type, seen messages.read%type)
  is begin
    update messages
    set read = seen
    where message_id = id;
  end;

  procedure get_messages_between_users(messages OUT sys_refcursor, id1 IN messages.sender_id%type, id2 IN messages.sender_id%type)
  is begin
    open messages for
    select sender, u.fname||' '||u.lname as receiver, a.text, a.timestamp
    from
      (select u.fname||' '||u.lname as sender, a.receiver_id, a.text, a.timestamp
      from
        (select * from
          (select m.sender_id, m.receiver_id, m.text, m.timestamp
          from messages m
          where m.sender_id = id1 and m.receiver_id = id2)
         union
          (select m.sender_id, m.receiver_id, m.text, m.timestamp
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
