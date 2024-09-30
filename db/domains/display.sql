-- Contains data related to how the core entities are shown.


BEGIN;


DROP SCHEMA IF EXISTS display CASCADE;
CREATE SCHEMA display;


CREATE TABLE display.users (
    _id BIGSERIAL NOT NULL,
    _inserted_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
    _core_user_id BIGSERIAL NOT NULL,

    name VARCHAR(50) NOT NULL,
    profile_picture VARCHAR,

    PRIMARY KEY (_id),
    FOREIGN KEY (_core_user_id) REFERENCES core.users (_id)
);


COMMIT;
