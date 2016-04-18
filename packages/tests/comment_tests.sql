declare
  id comments.comment_id%type;
begin
  --comment_pack.new_comment(id, 3, 1, 'This is a comment', 0);
  comment_pack.update_anonymous(3,0);
  comment_pack.update_text(3,'NEW COMMENT!');
  comment_pack.delete_comment(3,3);
  commit;
end;
/
