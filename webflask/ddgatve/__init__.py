# -*- coding: utf-8 -*-

import os

from flask import Flask

def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    #print(os.path.join(app.instance_path, 'ddgatve.sqlite'))
    app.config.from_mapping(
        #SECRET_KEY='dev',
        SECRET_KEY = b'Yu\xdat\x8epp\xa3\xf0\x81x\xbc\xcd\xc3\x923',
        #DATABASE=os.path.join(app.instance_path, 'ddgatve.sqlite'),
        DATABASE=os.path.join('/home/kalvis','ddgatve.sqlite'),
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
    
    from . import blog
    app.register_blueprint(blog.bp)
    app.add_url_rule('/', endpoint='index')
    
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

    return app


app = create_app()

if __name__ == '__main__':
    app.run(host='0.0.0.0')

