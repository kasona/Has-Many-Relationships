-- 1. Create a new postgres user named has_many_user
-- CREATE USER has_many_user;

-- 2. Create a new database named has_many_blogs owned by has_many_user
-- CREATE DATABASE has_many_blogs OWNER has_many_user;

-- 3. Before each create table statement, add a drop table if exists statement
 -- 4. Create the tables (including any PKs, Indexes, and Constraints that you may need) to fulfill the requirements of the has_many_blogs schema below.
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS comments;

CREATE TABLE IF NOT EXISTS users (
  id serial PRIMARY KEY NOT NULL,
  username character varying(90) NOT NULL,
  first_name character varying(90) DEFAULT NULL,
  last_name character varying(90) DEFAULT NULL,
  created_at timestamp WITH TIME ZONE NOT NULL DEFAULT Now(),
  updated_at timestamp WITH TIME ZONE NOT NULL DEFAULT Now()
);

CREATE TABLE IF NOT EXISTS posts (
  id serial PRIMARY KEY NOT NULL,
  title character varying(180) DEFAULT NULL,
  url character varying(510) DEFAULT NULL,
  content text DEFAULT NULL,
  created_at timestamp WITH TIME ZONE NOT NULL DEFAULT Now(),
  updated_at timestamp WITH TIME ZONE NOT NULL DEFAULT Now(),
  user_id integer REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS comments (
  id serial PRIMARY KEY NOT NULL,
  body character varying(510) DEFAULT NULL,
  created_at timestamp WITH TIME ZONE NOT NULL DEFAULT Now(),
  updated_at timestamp WITH TIME ZONE NOT NULL DEFAULT Now(),
  user_id integer REFERENCES users(id),
  post_id integer REFERENCES posts(id)
);



-- DROP TABLE IF EXISTS users CASCADE;

-- CREATE TABLE IF NOT EXISTS users (
--   id serial PRIMARY KEY NOT NULL,
--   username character varying(90) NOT NULL,
--   first_name character varying(90) DEFAULT NULL,
--   last_name character varying(90) DEFAULT NULL,
--   created_at timestamp WITH TIME ZONE NOT NULL DEFAULT Now(),
--   updated_at timestamp WITH TIME ZONE NOT NULL DEFAULT Now()
-- );

-- DROP TABLE IF EXISTS posts CASCADE;

-- CREATE TABLE IF NOT EXISTS posts (
--   id serial PRIMARY KEY NOT NULL,
--   title character varying(180) DEFAULT NULL,
--   url character varying(510) DEFAULT NULL,
--   content text DEFAULT NULL,
--   created_at timestamp WITH TIME ZONE NOT NULL DEFAULT Now(),
--   updated_at timestamp WITH TIME ZONE NOT NULL DEFAULT Now(),
--   user_id integer references users(id)
-- );

-- DROP TABLE IF EXISTS comments CASCADE;

-- CREATE TABLE IF NOT EXISTS comments (
--   id serial PRIMARY KEY NOT NULL,
--   body character varying(510) DEFAULT NULL,
--   created_at timestamp WITH TIME ZONE NOT NULL DEFAULT Now(),
--   updated_at timestamp WITH TIME ZONE NOT NULL DEFAULT Now(),
--   post_id integer references posts(id),
--   user_id integer references users(id)
-- );
-- 5. Create the necessary FKs needed to relate the tables according to the relationship table

-- 6. Run the scripts/blog_data.sql
-- \i scripts/blog_data.sql

