-- 1. Create a query to get all fields from the users table
-- SELECT * FROM users;

-- (50000 rows)

-- 2. Create a query to get all fields from the posts table where the user_id is 100
-- SELECT user_id FROM posts
-- WHERE user_id = 100;

-- (1 Row)

-- 3. Create a query to get all posts fields, the user's first name, and the user's last name, from the posts table where the user's id is 200
-- SELECT users.first_name, users.last_name
-- FROM users
-- INNER JOIN posts
-- ON users.id = posts.user_id
-- WHERE posts.user_id = 200;

-- (Johnny Stoltenberg)

-- 4. Create a query to get all posts fields, and the user's username, from the posts table where the user's first name is 'Norene' and the user's last_name is 'Schmitt'
-- SELECT users.username
-- FROM users
-- INNER JOIN posts
-- ON users.id = posts.user_id
-- WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

-- (Nora.Quigley45)

-- 5. Create a query to get usernames from the users table where the user has created a post after January 1, 2015
-- SELECT users.username
-- FROM users
-- INNER JOIN posts
-- ON users.id = posts.id
-- WHERE posts.created_at >= '2015-01-01';

-- (26598 rows)

-- 6. Create a query to get the post title, post content, and user's username where the user who created the post joined before January 1, 2015

-- SELECT posts.title, posts.content, users.username
-- FROM users
-- INNER JOIN posts
-- ON users.id = user_id
-- WHERE users.created_at < '2015-01-01';
-- (23488 rows)

-- 7. Create a query to get the all rows in the comments table, showing post title (aliased as 'Post Title'), and the all the comment's fields

-- SELECT posts.title AS "Post Title"
-- FROM comments
-- INNER JOIN posts
-- ON posts.id = post_id;
-- (19729 rows)

-- 8. Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created before January 1, 2015

-- SELECT posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body"
-- FROM comments
-- INNER JOIN posts
-- ON posts.id = post_id
-- WHERE posts.created_at < '2015-01-01';
-- (9126 rows)

-- 9. Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created after January 1, 2015
-- SELECT posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body"
-- FROM comments
-- INNER JOIN posts
-- ON posts.id = post_id
-- WHERE posts.created_at > '2015-01-01';
-- (10603 rows)

-- 10. Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the comment body contains the word 'USB'
-- SELECT posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body"
-- FROM comments
-- INNER JOIN posts
-- ON comments.post_id = posts.id
-- WHERE comments.body LIKE '%USB%';

-- (728 rows)

-- 11. Create a query to get the post title (aliased as post_title), first name of the author of the post, last name of the author of the post, and comment body (aliased to comment_body), where the comment body contains the word 'matrix' ( should have 855 results )
-- SELECT posts.title, users.first_name, users.last_name, comments.body
-- FROM comments
-- INNER JOIN posts
-- ON posts.id = post_id
-- INNER JOIN users
-- ON users.id = comments.user_id
-- WHERE comments.body LIKE '%matrix%';

-- (855 rows)

-- 12. Create a query to get the first name of the author of the comment, last name of the author of the comment, and comment body (aliased to comment_body), where the comment body contains the word 'SSL' and the post content contains the word 'dolorum' ( should have 102 results )
-- SELECT users.first_name, users.last_name, comments.body
-- FROM comments
-- INNER JOIN users
-- ON users.id = comments.user_id
-- INNER JOIN posts
-- ON posts.id = post_id
-- WHERE comments.body LIKE '%SSL%'
-- AND posts.content LIKE '%dolorum%';

-- (102 rows)

-- 13. Create a query to get the first name of the author of the post (aliased to post_author_first_name), last name of the author of the post (aliased to post_author_last_name), the post title (aliased to post_title), username of the author of the comment (aliased to comment_author_username), and comment body (aliased to comment_body), where the comment body contains the word 'SSL' or 'firewall' and the post content contains the word 'nemo' ( should have 197 results )

SELECT pu.first_name,
       pu.last_name,
       posts.title,
      cu.username,
      comments.body
FROM comments
INNER JOIN users cu ON cu.id = user_id
INNER JOIN posts ON posts.id = post_id
INNER JOIN users pu ON pu.id = posts.user_id
WHERE comments.body ~* 'SSL|firewall'
AND posts.content LIKE '%nemo%';

-- 218 rows



