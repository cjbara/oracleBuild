create or replace package post_pack
is
  procedure new_post(id OUT posts.post_id%type, userid IN posts.user_id%type, price IN posts.price%type, obo IN posts.orbestoffer%type, title IN posts.title%type, descr IN posts.description%type, category IN posts.category_id%type, loc IN posts.location%type);

  procedure update_price(id posts.post_id%type, p posts.price%type);
  procedure update_obo(id posts.post_id%type, obo posts.orbestoffer%type);
  procedure update_title(id posts.post_id%type, t posts.title%type);
  procedure update_desc(id posts.post_id%type, descr posts.description%type);
  procedure update_category(id posts.post_id%type, category posts.category_id%type);
  procedure update_location(id posts.post_id%type, loc posts.location%type);
  procedure update_sold(id posts.post_id%type, s posts.sold%type);

  procedure get_all_posts(posts OUT sys_refcursor);
  procedure get_posts_by_user(posts OUT sys_refcursor, userid IN posts.user_id%type);

  procedure get_post_info(id IN posts.post_id%type, info OUT sys_refcursor);

  procedure delete_post(id posts.post_id%type, userid posts.user_id%type);
end post_pack;
/
