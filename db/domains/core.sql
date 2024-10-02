-- The 'core' domain and its related tables are, as the name states, the platform's
-- main domain. Other domains relate (directly or by transition) with this one. 


BEGIN;


DROP SCHEMA IF EXISTS core CASCADE;
CREATE SCHEMA core;


CREATE TABLE core.users (
    _id BIGSERIAL NOT NULL,
    _inserted_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),

    username VARCHAR(15) NOT NULL UNIQUE,
    -- TODO add flags, states and timestamp of signup

    PRIMARY KEY (_id)
);


CREATE TABLE core.posts (
    _id BIGSERIAL NOT NULL,
    _inserted_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),

    author_id BIGSERIAL NOT NULL,
    content VARCHAR(140) NOT NULL, -- posts cannot be 'empty'
    published_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,

    PRIMARY KEY (_id),
    FOREIGN KEY (author_id) REFERENCES core.users (_id)
);


COMMIT;
