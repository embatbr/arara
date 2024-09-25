BEGIN;


DROP SCHEMA IF EXISTS login CASCADE;
CREATE SCHEMA login;


CREATE TABLE login.users (
    _id BIGSERIAL NOT NULL,
    --_table_hash

    email VARCHAR(320) NOT NULL,
    password VARCHAR(100) NOT NULL, -- stored as plaintext, for now
    core_user_id BIGSERIAL,

    PRIMARY KEY (_id),
    FOREIGN KEY (core_user_id) REFERENCES core.users (_id)
);


COMMIT;
