from configparser import ConfigParser
import os

from wsgiref.simple_server import make_server
import falcon

from .frontends import FrontEndIndex
from .backends import BackEndFeed


PROJECT_ROOT_PATH = os.environ['PROJECT_ROOT_PATH']
STATIC_PATH = f'{PROJECT_ROOT_PATH}/bemtevi/static'


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
backend_feed = BackEndFeed(db_config)
frontend_index = FrontEndIndex(backend_feed)

app.add_route('/', frontend_index)

app.add_static_route('/images', f'{STATIC_PATH}/images')
app.add_static_route('/css', f'{STATIC_PATH}/css')
