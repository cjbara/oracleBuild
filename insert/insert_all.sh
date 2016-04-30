echo '*** Inserting values into USERS ***'
sqlldr guest/guest control=insert_users.sql
#echo '*** Inserting values into POSTS ***'
#sqlldr guest/guest control=insert_posts.sql
#echo '*** Inserting values into COMMENTS ***'
#sqlldr guest/guest control=insert_comments.sql
#echo '*** Inserting values into MESSAGES ***'
#sqlldr guest/guest control=insert_messages.sql
echo '*** Inserting values into CATEGORIES ***'
sqlldr guest/guest control=insert_categories.sql
#echo '*** Inserting values into IMAGES ***'
#sqlldr guest/guest control=insert_images.sql
