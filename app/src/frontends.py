"""Kind of "controllers" that respond to a specified path returning a webpage.
"""

import json

import falcon
from jinja2 import Environment, FileSystemLoader

from src.settings import Env


class FrontEnd(object):
    """Base class for the front ends.
    """

    def __init__(self, backend):
        super(FrontEnd, self).__init__()

        self.backend = backend


class FrontEndIndex(FrontEnd):
    """Index page shows the feed, according to the user defined settings.
    """

    def __init__(self, backend):
        super(FrontEndIndex, self).__init__(backend)

    def on_get(self, req, resp):
        feed = self.backend.get_feed()

        # OBS: gambiarra; TODO trocar pelo usuário logado
        logged_user = {
            "user_displayname": feed[0]['user_displayname'],
            "username": feed[0]["username"]
        }

        jinja2_env = Environment(loader=FileSystemLoader(Env.HTML_TEMPLATES_PATH))
        template = jinja2_env.get_template("index.html")
        webpage = template.render(listFlag=True, items=feed, logged_user=logged_user)

        resp.status = falcon.HTTP_200
        resp.content_type = "text/html"
        resp.text = webpage
