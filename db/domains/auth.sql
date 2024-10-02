BEGIN;


DROP SCHEMA IF EXISTS auth CASCADE;
CREATE SCHEMA auth;


CREATE TABLE auth.users ( -- using basic http auth
    _id BIGSERIAL NOT NULL,
    _inserted_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
    _core_user_id BIGSERIAL NOT NULL,

    username VARCHAR(320) NOT NULL,
    password VARCHAR(100) NOT NULL, -- stored as plaintext, for now

    PRIMARY KEY (_id),
    FOREIGN KEY (_core_user_id) REFERENCES core.users (_id)
);


COMMIT;
