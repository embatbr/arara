from configparser import ConfigParser

from wsgiref.simple_server import make_server
import falcon

from .frontends import FrontEndIndex
from .backends import BackEndCore


def load_config(filename, section):
    parser = ConfigParser()
    parser.read(filename)

    config = dict()
    if parser.has_section(section):
        params = parser.items(section)
        for param in params:
            config[param[0]] = param[1]
    else:
        raise Exception('Section {0} not found in the {1} file'.format(section, filename))

    return config


app = falcon.App()

db_config = load_config('database.ini', 'postgresql')
backend_core = BackEndCore(db_config)
frontend_index = FrontEndIndex(backend_core)

app.add_route('/', frontend_index)
