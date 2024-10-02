"""Basically a layer of "persistence" over the database.
"""

import psycopg2

from src.settings import Env


class BackEnd(object):
    """Base class for back ends.
    """

    def __init__(self, db_config_section):
        super(BackEnd, self).__init__()

        self._db_config_section = db_config_section # TODO remove
        self._conn = None

    @property
    def conn(self):
        if (self._conn is None) or (self._conn.closed != 0):
            try:
                db_config = Env.DB_CONFIGS[self._db_config_section]
                self._conn = psycopg2.connect(**db_config)
                print('Connected to the PostgreSQL server.')

            except (psycopg2.DatabaseError, Exception) as error:
                print('error:', error)
                self._conn = None
                raise error

        return self._conn


class BackEndAuth(BackEnd):
    """Responsible to authenticate user.
    """
    
    def __init__(self, db_config_section="auth"):
        super(BackEndAuth, self).__init__(db_config_section)

    def authenticate(self, username, password):
        if not self.conn:
            raise psycopg2.DatabaseError("No database connection")

        query = """SELECT
        EXISTS(
            SELECT
                1
            FROM
                auth.users
            WHERE
                username='{0}' AND
                password='{1}'
        );
        """.format(username, password)

        cur = self.conn.cursor()
        cur.execute(query)
        result = cur.fetchone()[0]

        return result


class BackEndFeed(BackEnd):
    """Responsible to retrieve the feed.
    """

    def __init__(self, db_config_section="feed"):
        super(BackEndFeed, self).__init__(db_config_section)

    def get_user_display_info(self, username):
        if not self.conn:
            raise psycopg2.DatabaseError("No database connection")

        query = """SELECT
            A.name,
            A.profile_picture
        FROM
            display.users A
        INNER JOIN
            core.users B
            ON
                A._core_user_id = B._id AND
                B.username = '{0}';
        """.format(username)

        cur = self.conn.cursor()
        cur.execute(query)
        result = cur.fetchone()

        return {
            'display_name': result[0],
            'profile_picture': result[1]
        }

        print(result)

    def get_feed(self):
        if not self.conn:
            raise psycopg2.DatabaseError("No database connection")

        query = """SELECT
            B.username,
            C.name AS display_name,
            C.profile_picture,
            A.published_at,
            A.content
        FROM
            core.posts A
        INNER JOIN
            core.users B
            ON
                A.author_id = B._id
        LEFT JOIN
            display.users C
            ON
                B._id = C._core_user_id
        ORDER BY
            A.published_at DESC;
        """

        cur = self.conn.cursor()
        cur.execute(query)
        result = cur.fetchall()

        ret = list()
        for (username, display_name, profile_picture, published_at, content) in result:
            ret.append({
                'username': username,
                'user_display_name': display_name,
                'user_profile_picture': profile_picture,
                'post_publish_date': published_at.strftime('%Y-%m-%d %H:%M:%S'),
                'post_content': content
            })

        return ret
