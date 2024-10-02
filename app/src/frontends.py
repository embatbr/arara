"""Kind of "controllers" that respond to a specified path returning a webpage.
"""

import json

import falcon
from jinja2 import Environment, FileSystemLoader

from src.settings import Env
import src.utils as utils


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
        token = req.get_header('Authorization') # must be logged for this
        (username, _) = utils.decode_basic_http_auth(token, decode_pwd=False)

        feed = self.backend.get_feed()

        logged_user_info = self.backend.get_user_display_info(username)
        logged_user = {
            "username": username,
            "display_name": logged_user_info['display_name'],
            "profile_picture": logged_user_info['profile_picture']
        }

        jinja2_env = Environment(loader=FileSystemLoader(Env.HTML_TEMPLATES_PATH))
        template = jinja2_env.get_template("index.html")
        webpage = template.render(listFlag=True, items=feed, logged_user=logged_user)

        resp.status = falcon.HTTP_200
        resp.content_type = "text/html"
        resp.text = webpage


# class FrontEndAuth(FrontEnd):
#     """Returns a page for signin or signup.
#     """

#     def __init__(self):
#         super(FrontEndAuth, self).__init__(None)

#     # def __init__(self, backend):
#     #     super(FrontEndAuth, self).__init__(backend)

#     def on_get(self, req, resp): # TODO add option for signup later (needs other pages)
#         jinja2_env = Environment(loader=FileSystemLoader(Env.HTML_TEMPLATES_PATH))
#         template = jinja2_env.get_template("signin.html")
#         webpage = template.render()

#         resp.status = falcon.HTTP_200
#         resp.content_type = "text/html"
#         resp.text = webpage
