create or replace package body post_pack
is
--=== Creates a new post based on input and return new post_id ===
  procedure new_post(id OUT posts.post_id%type, userid IN posts.user_id%type, price IN posts.price%type, obo IN posts.orbestoffer%type, title IN posts.title%type, descr IN posts.description%type, category IN posts.category_id%type, loc IN posts.location%type)
  is
    free posts.free%type;
  begin
    if price = 0 then
      free := 1;
    else
      free := 0;
    end if;
    insert into posts (user_id, price, free, title, description, category_id, orbestoffer, location) 
    values (userid, price, free, title, descr, category, obo, loc);
    id := post_id_seq.currval;
  end;

--=== Updates different parts of a post based on input
  procedure update_price(id posts.post_id%type, p posts.price%type)
  is
    f posts.free%type;
  begin
    if p = 0 then
      f := 1;
    else
      f := 0;
    end if;
    update posts
    set price = p, free = f
    where post_id = id;
  end;

  procedure update_obo(id posts.post_id%type, obo posts.orbestoffer%type)
  is begin
    update posts
    set orbestoffer = obo
    where post_id = id;
  end;

  procedure update_title(id posts.post_id%type, t posts.title%type)
  is begin
    update posts
    set title = t
    where post_id = id;
  end;

  procedure update_desc(id posts.post_id%type, descr posts.description%type)
  is begin
    update posts
    set description = descr
    where post_id = id;
  end;

  procedure update_category(id posts.post_id%type, category posts.category_id%type)
  is begin
    update posts
    set category_id = category
    where post_id = id;
  end;

  procedure update_location(id posts.post_id%type, loc posts.location%type)
  is begin
    update posts
    set location = loc
    where post_id = id;
  end;

  procedure update_sold(id posts.post_id%type, s posts.sold%type)
  is begin
    update posts
    set sold = s
    where post_id = id;
  end;

--==returns a cursor to the query
  procedure get_all_posts(posts OUT sys_refcursor)
  is begin 
    open posts for 
    select a.post_id, fname ||' '|| lname name, title, description, price, numComments, timestamp, category, orbestoffer best, location, free
    from (
      select p.post_id, count(comment_id) numComments
      from posts p, comments c
      where p.post_id = c.post_id
      group by p.post_id
    ) a, posts p, users u, categories
    where p.user_id = u.user_id
    and p.category_id = categories.category_id
    order by timestamp;
  end;

  procedure get_posts_by_user(posts OUT sys_refcursor, userid IN posts.user_id%type)
  is begin 
    open posts for 
    select a.post_id, fname ||' '|| lname name, title, description, price, numComments, timestamp, category, orbestoffer best, location, free
    from (
      select p.post_id, count(comment_id) numComments
      from posts p, comments c
      where p.post_id = c.post_id
      and p.user_id = userid
      group by p.post_id
    ) a, posts p, users u, categories
    where p.user_id = u.user_id
    and p.category_id = categories.category_id
    order by timestamp;
  end;

--=== Gets the information for a post by ID ===
  procedure get_post_info(id IN posts.post_id%type, info OUT sys_refcursor)
  is begin
    open info for
    select post_id, fname ||' '|| lname name, title, description, price,
    timestamp post_time, category, orbestoffer best, location, free
    from posts p, users u, categories
    where p.user_id = u.user_id
    and p.category_id = categories.category_id
    and post_id = id
    order by post_time;
  end;

--=== Deletes a post when the right user tries to delete it ===
  procedure delete_post(id posts.post_id%type, userid posts.user_id%type)
  is begin
    delete from posts
    where post_id = id
    and user_id = userid;
  end;

end post_pack;
/
