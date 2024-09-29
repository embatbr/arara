"""Basically a layer of "persistence" over the database.
"""

import psycopg2


class BackEnd(object):
    """Base class for back ends.
    """

    def __init__(self, db_config):
        super(BackEnd, self).__init__()

        self._db_config = db_config
        self._conn = None

    @property
    def conn(self):
        if (self._conn is None) or (self._conn.closed != 0):
            try:
                self._conn = psycopg2.connect(**self._db_config)
                print('Connected to the PostgreSQL server.')
            except (psycopg2.DatabaseError, Exception) as error:
                print('error:', error)
                self._conn = None
                raise error

        return self._conn


class BackEndFeed(BackEnd):

    def __init__(self, db_config):
        super(BackEndFeed, self).__init__(db_config)

    def get_feed(self):
        query = """
        SELECT
            B.username,
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
        for (username, published_at, content) in result:
            ret.append({
                'username': username,
                'publish_date': published_at.strftime('%Y-%m-%d %H:%M:%S'),
                'content': content
            })

        return ret
