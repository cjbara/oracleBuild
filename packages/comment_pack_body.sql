create or replace package body comment_pack
is
  procedure new_comment(id OUT comments.comment_id%type, userid IN comments.user_id%type, postid IN comments.post_id%type, txt IN comments.text%type, anon IN comments.anonymous%type)
  is begin
    insert into comments (user_id, post_id, text, anonymous) 
    values (userid, postid, txt, anon);
    id := comment_id_seq.currval;
  end;

  procedure update_text(id comments.comment_id%type, t comments.text%type)
  is begin
    update comments
    set text = t
    where comment_id = id;
  end;

  procedure update_anonymous(id comments.comment_id%type, a comments.anonymous%type)
  is begin
    update comments
    set anonymous = a
    where comment_id = id;
  end;

  procedure comments_for_post(postid IN comments.post_id%type, comments OUT sys_refcursor)
  is begin
    open comments for
    select u.fname || ' ' || u.lname name, c.text, timestamp comment_time, anonymous a
    from comments c, users u
    where c.post_id = postid
    and c.user_id = u.user_id;
  end;

  procedure delete_comment(id comments.comment_id%type, userid comments.user_id%type)
  is begin
    delete from comments
    where comment_id = id
    and user_id = userid;
  end;

end comment_pack;
/
