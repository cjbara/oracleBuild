create or replace package message_pack
is
  procedure get_message_conversation(messages OUT sys_refcursor, id1 IN messages.sender_id%type);

  procedure send_message(id OUT messages.message_id%type, senderid IN messages.sender_id%type, receiverid IN messages.receiver_id%type, txt IN messages.text%type);

  procedure mark_message(id messages.message_id%type, seen messages.read%type);

  procedure get_messages_between_users(messages OUT sys_refcursor, id1 IN messages.sender_id%type, id2 IN messages.sender_id%type);

end message_pack;
/
