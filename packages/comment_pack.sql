create or replace package comment_pack
is
  procedure new_comment(id OUT comments.comment_id%type, userid IN comments.user_id%type, postid IN comments.post_id%type, txt IN comments.text%type, anon IN comments.anonymous%type);

  procedure update_text(id comments.comment_id%type, t comments.text%type);
  procedure update_anonymous(id comments.comment_id%type, a comments.anonymous%type);

  procedure comments_for_post(postid IN comments.post_id%type, comments OUT sys_refcursor);

  procedure delete_comment(id comments.comment_id%type, userid comments.user_id%type);
end comment_pack;
/
