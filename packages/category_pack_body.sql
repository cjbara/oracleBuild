create or replace package body category_pack
is
  procedure new_category(id OUT categories.category_id%type, cat IN categories.category%type, userid IN categories.created_by%type)
  is begin
    insert into categories (category, created_by)
    values (cat, userid);
    id := category_id_seq.currval;
  end;

  procedure cat_id_by_name(id OUT categories.category_id%type, name IN categories.category%type)
  is begin
    select category_id into id
    from categories where category = name;
  end;

  procedure cat_name_by_id(id IN categories.category_id%type, name OUT categories.category%type)
  is begin
    select category into name
    from categories where category_id = id;
  end;

  procedure get_all_categories(info OUT sys_refcursor)
  is begin
    open info for
    select * from categories;
  end;

end category_pack;
/
