# -*- coding: utf-8 -*-

import os
from flask_restful import Api

from flask import Flask
from werkzeug.middleware.dispatcher import DispatcherMiddleware
from werkzeug.wrappers import Response

# https://dlukes.github.io/flask-wsgi-url-prefix.html
def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    dbHome = app.instance_path
    if os.name == 'posix':
        dbHome = '/home/kalvis'
    app.config.from_mapping(
        #SECRET_KEY='dev',
        SECRET_KEY = b'Yu\xdat\x8epp\xa3\xf0\x81x\xbc\xcd\xc3\x923',
        DATABASE=os.path.join(dbHome, 'ddgatve.sqlite'),
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # a simple page that says hello
    @app.route('/hello')
    def hello():
        return 'Hello, World!'

    from . import db
    db.init_app(app)
    
    from . import auth
    app.register_blueprint(auth.bp)
    
#    from . import blog
#    app.register_blueprint(blog.bp)
#    app.add_url_rule('/', endpoint='index')

    from . import blog
    app.register_blueprint(blog.bp)
    
    from . import data_structures_fall2020
    app.register_blueprint(data_structures_fall2020.bp)

    from . import data_structures_fall2021
    app.register_blueprint(data_structures_fall2021.bp)

    from . import algorithms
    app.register_blueprint(algorithms.bp)

    from . import numtheory
    app.register_blueprint(numtheory.bp)
    
    from . import discrete_spring2020
    app.register_blueprint(discrete_spring2020.bp)

    from . import discrete_spring2021
    app.register_blueprint(discrete_spring2021.bp)

    from . import discrete_spring2022
    app.register_blueprint(discrete_spring2022.bp)

    from . import onlinetests
    app.register_blueprint(onlinetests.bp)


    from . import default
    app.register_blueprint(default.bp)
    app.add_url_rule('/', endpoint='index')

    app.wsgi_app = DispatcherMiddleware(
        Response('Not Found', status=404),
        {'/courses': app.wsgi_app}
    )   


    return app


app = create_app()

if __name__ == '__main__':
    app.run(host='0.0.0.0')

    