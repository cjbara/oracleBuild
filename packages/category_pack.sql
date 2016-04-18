create or replace package category_pack
is
  procedure new_category(id OUT categories.category_id%type, cat IN categories.category%type, userid IN categories.created_by%type);

  procedure cat_id_by_name(id OUT categories.category_id%type, name IN categories.category%type);
  procedure cat_name_by_id(id IN categories.category_id%type, name OUT categories.category%type);

  procedure get_all_categories(info OUT sys_refcursor);

end category_pack;
/
