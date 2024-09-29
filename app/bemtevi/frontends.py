"""Controllers that respond to a specified path returning a webpage.
"""

import json

import falcon


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

        resp.status = falcon.HTTP_200
        resp.content_type = "text/html" # Default is application/json, so override
        with open('bemtevi/content/index.html', 'r') as file:
            resp.body = file.read()
        # resp.text = json.dumps(feed, ensure_ascii=False, indent=4)
