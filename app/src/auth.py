"""Authentication classes.
"""

import base64

import falcon

import src.utils as utils


class SimpleAuth(object):

    def __init__(self, backend):
        super(SimpleAuth, self).__init__()

        self.backend = backend

    def process_request(self, req, resp):
        token = req.get_header('Authorization')

        challenges = ['Basic realm="staging server"']

        if token is None:
            description = 'Please provide an auth token as part of the request.'

            raise falcon.HTTPUnauthorized(
                title='Auth token required',
                description=description,
                challenges=challenges
            )

        # if not self._token_is_valid(token, account_id):
        if not self._token_is_valid(token):
            description = (
                'The provided auth token is not valid. '
                'Please request a new token and try again.'
            )

            raise falcon.HTTPUnauthorized(
                title='Authentication required',
                description=description,
                challenges=challenges
            )

    def _token_is_valid(self, token):
        (username, password) = utils.decode_basic_http_auth(token)

        return self.backend.authenticate(username, password)
