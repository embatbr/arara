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
    """Index page shows the timeline, according to the user defined settings.
    """

    def __init__(self, backend):
        super(FrontEndIndex, self).__init__(backend)

    def on_get(self, req, resp):
        timeline = self.backend.get_timeline()

        resp.status = falcon.HTTP_200
        # resp.content_type = falcon.MEDIA_TEXT # Default is application/json, so override
        resp.text = json.dumps(timeline, ensure_ascii=False, indent=4)
