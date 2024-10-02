from wsgiref.simple_server import make_server
import falcon

from src.auth import SimpleAuth
from src.frontends import FrontEndIndex
from src.backends import BackEndAuth, BackEndFeed
from src.settings import Env


Env.load()
print(Env.show()) # TODO remove this


backend_auth = BackEndAuth()
simple_auth = SimpleAuth(backend_auth)
app = falcon.App(middleware=simple_auth)

backend_feed = BackEndFeed()
frontend_index = FrontEndIndex(backend_feed)

app.add_route('/', frontend_index)

app.add_static_route('/images', f'{Env.STATIC_PATH}/images')
app.add_static_route('/css', f'{Env.STATIC_PATH}/css')
app.add_static_route('/js', f'{Env.STATIC_PATH}/js')
