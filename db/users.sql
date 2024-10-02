-- More configurations for users.


BEGIN;


-- auth

GRANT USAGE ON SCHEMA auth TO auth;

-- GRANT SELECT (_core_user_id, username, password) ON TABLE auth.users TO auth;
GRANT SELECT (username, password) ON TABLE auth.users TO auth;


-- feed

GRANT USAGE ON SCHEMA core TO feed;

GRANT SELECT (_id, username) ON TABLE core.users TO feed;

GRANT SELECT (_id, author_id, content, published_at) ON TABLE core.posts TO feed;


GRANT USAGE ON SCHEMA display TO feed;

GRANT SELECT (_core_user_id, name, profile_picture) ON TABLE display.users TO feed;


COMMIT;
