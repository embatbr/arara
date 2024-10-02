"""Useful code common to many parts of the system.
"""

import base64


def decode_basic_http_auth(token, decode_pwd=True):
    credentials = token.split()[1]
    credentials = base64.b64decode(credentials).decode('utf8')
    credentials = credentials.split(':')
    username = credentials[0]
    password = credentials[1]

    return (username, password if decode_pwd else None)
