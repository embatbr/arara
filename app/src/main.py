from wsgiref.simple_server import make_server
import falcon

from src.frontends import FrontEndIndex
from src.backends import BackEndFeed
from src.settings import Env


Env.load()
print(Env.show()) # TODO remove this

app = falcon.App()

backend_feed = BackEndFeed()
frontend_index = FrontEndIndex(backend_feed)

app.add_route('/', frontend_index)

app.add_static_route('/images', f'{Env.STATIC_PATH}/images')
app.add_static_route('/css', f'{Env.STATIC_PATH}/css')
app.add_static_route('/js', f'{Env.STATIC_PATH}/js')
