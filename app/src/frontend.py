"""
"""


import falcon


class FrontEnd(object):
    """Base class for the front ends.
    """

    def __init__(self, backend):
        super(FrontEnd, self).__init__()

        self.backend = backend


class FrontEndTimeline(FrontEnd):

    def __init__(self, backend):
        super(FrontEndTimeline, self).__init__(backend)

    def on_get(self, req, resp):
        resp.status = falcon.HTTP_200
        resp.content_type = falcon.MEDIA_TEXT # Default is JSON, so override
        resp.text = "foobar"


class FrontEndUser(object):
    """docstring for FrontEndUser"""
    def __init__(self, arg):
        super(FrontEndUser, self).__init__()
        self.arg = arg


class FrontEndPost(object):
    """docstring for FrontEndPost"""
    def __init__(self, arg):
        super(FrontEndPost, self).__init__()
        self.arg = arg
        
