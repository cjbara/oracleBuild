declare 
  id posts.post_id%type;
begin
  --post_pack.create_new_post(id, 1, 30, 0, 'Water Bottle', 'Gatorade Bottle', 1, 'Fisher Hall');
  post_pack.update_sold(9, 1);
  post_pack.delete_post(8, 1);
end;
/
