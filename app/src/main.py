from wsgiref.simple_server import make_server

import falcon

from frontend import FrontEndTimeline
from backend import BackEndCore


app = falcon.App()

backend_core = BackEndCore()
frontend_timeline = FrontEndTimeline(backend_core)

app.add_route('/', frontend_timeline)

if __name__ == '__main__':
    with make_server('', 8000, app) as httpd:
        print('Serving on port 8000...')

        # Serve until process is killed
        httpd.serve_forever()
