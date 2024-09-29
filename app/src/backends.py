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


class BackEndFeed(BackEnd):

    def __init__(self, db_config_section="feed"):
        super(BackEndFeed, self).__init__(db_config_section)

    def get_feed(self):
        if not self.conn:
            raise psycopg2.DatabaseError("No database connection")

        query = """
        SELECT
            B.username,
            B.display_name,
            A.published_at,
            A.content
        FROM
            core.posts A
        INNER JOIN
            core.users B
            ON
                A.author_id = B._id
        ORDER BY
            A.published_at DESC;
        """
        cur = self.conn.cursor()
        cur.execute(query)
        result = cur.fetchall()

        ret = list()
        for (username, display_name, published_at, content) in result:
            ret.append({
                'username': username,
                'user_displayname': display_name,
                'post_publish_date': published_at.strftime('%Y-%m-%d %H:%M:%S'),
                'post_content': content
            })

        return ret
