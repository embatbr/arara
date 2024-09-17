-- The 'core' domain and its related tables are, as the name states, the platform's
-- main domain. Other domains related (directly or by transition) with this one. 


BEGIN;


DROP SCHEMA IF EXISTS core CASCADE;
CREATE SCHEMA core;


CREATE TABLE core.users (
    _id BIGSERIAL NOT NULL,
    --_table_hash 

    username VARCHAR(15) NOT NULL UNIQUE,
    -- TODO add flags and states

    PRIMARY KEY (_id)
);


-- -- CREATE TABLE core.posts (
-- --     id BIGSERIAL NOT NULL,
-- --     btv_user_id BIGSERIAL NOT NULL,

-- --     is_reply_flag BOOLEAN NOT NULL DEFAULT false,
-- --     replied_to_post_id BIGSERIAL,

-- --     PRIMARY KEY (id),
-- --     FOREIGN KEY (btv_user_id) REFERENCES core.users,
-- --     FOREIGN KEY (replied_to_post_id) REFERENCES core.posts
-- -- );


COMMIT;
