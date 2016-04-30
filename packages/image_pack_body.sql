create or replace package body image_pack
is
  procedure update_image(id OUT images.image_id%type, postid IN images.post_id%type, i OUT images.image%type)
  is 
    old_id images.image_id%type;
  begin
    select image_id
    into old_id
    from images
    where post_id = postid;

    if old_id is not null
    then
      delete from images where image_id = old_id;
    end if;
    
    insert into images (post_id, image) values (postid, EMPTY_BLOB()) returning image into i;
    id := image_id_seq.currval;

  exception 
    when NO_DATA_FOUND then
      insert into images (post_id, image) values (postid, EMPTY_BLOB()) returning image into i;
      id := image_id_seq.currval;
  end;

  procedure get_image_by_id(id IN images.post_id%type, img OUT images.image%type)
  is begin
    select image
    into img
    from images
    where post_id = id;
  exception
    when NO_DATA_FOUND then
      select image
      into img
      from images
      where post_id = 0;
  end;

  procedure image_exists_for_post(id IN images.post_id%type, imgid OUT images.image_id%type)
  is begin
    select image_id
    into imgid
    from images
    where post_id = id;
  exception
    when NO_DATA_FOUND then
      imgid := -1;
  end;

end image_pack;
/
