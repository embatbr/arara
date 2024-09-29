"""Controllers that respond to a specified path returning a webpage.
"""

import json

import falcon
from jinja2 import Environment, FileSystemLoader


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

        jinja2_env = Environment(loader=FileSystemLoader("bemtevi/static/templates"))
        template = jinja2_env.get_template("index.html")
        rendered_template = template.render(**feed[0])

        resp.status = falcon.HTTP_200
        resp.content_type = "text/html" # Default is application/json, so override
        resp.text = rendered_template

        # with open('bemtevi/content/index.html', 'r') as file:
        #     resp.body = file.read()
        # resp.text = json.dumps(feed, ensure_ascii=False, indent=4)
