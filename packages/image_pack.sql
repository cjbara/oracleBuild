create or replace package image_pack
is
  procedure update_image(id OUT images.image_id%type, postid IN images.post_id%type, i OUT images.image%type);

  procedure get_image_by_id(id IN images.post_id%type, img OUT images.image%type);
  procedure image_exists_for_post(id IN images.post_id%type, imgid OUT images.image_id%type);

end image_pack;
/
