BEGIN;


CREATE SCHEMA basic;


CREATE TABLE basic.btv_users (
    id BIGSERIAL NOT NULL,
    username VARCHAR(15) NOT NULL UNIQUE,

    PRIMARY KEY (id)
);


-- -- CREATE TABLE basic.btv_posts (
-- --     id BIGSERIAL NOT NULL,
-- --     btv_user_id BIGSERIAL NOT NULL,

-- --     is_reply_flag BOOLEAN NOT NULL DEFAULT false,
-- --     replied_to_post_id BIGSERIAL,

-- --     PRIMARY KEY (id),
-- --     FOREIGN KEY (btv_user_id) REFERENCES basic.btv_users,
-- --     FOREIGN KEY (replied_to_post_id) REFERENCES basic.btv_posts
-- -- );


COMMIT;
