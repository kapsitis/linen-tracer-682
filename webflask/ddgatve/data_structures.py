import functools, os

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for, json, current_app
)
#from werkzeug.security import check_password_hash, generate_password_hash

#from ddgatve.db import get_db

bp = Blueprint('data_structures', __name__, url_prefix='/data-structures')

@bp.route('/index', methods=['GET', 'POST'])
def index():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url))
    json_url = os.path.join(current_app.root_path, 'static/data', 'data_structures_topics.json')
    jsonTopics = json.load(open(json_url))
    template_context = {
                'my_id': 'index.html',
                'course': 'data-structures',
                'nav_items': nav_items,
                'jsonTopics': jsonTopics
            }
    
    return render_template('data_structures/index.html', **template_context)


@bp.route('/assignments', methods=['GET','POST'])
def assignments():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url))
    template_context = {
                'my_id': 'assignments.html',
                'course': 'data-structures',
                'nav_items': nav_items
            }
    
    return render_template('data_structures/assignments.html', **template_context)


@bp.route('/slides', methods=['GET','POST'])
def slides():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url))
    modules_url = os.path.join(current_app.root_path, 'static/data', 'data_structures_modules.json')
    jsonModules = json.load(open(modules_url))
    template_context = {
        'my_id': 'slides.html',
        'course': 'data-structures',
        'jsonModules': jsonModules,
        'nav_items': nav_items
    }
    
    return render_template('data_structures/slides.html', **template_context)


@bp.route('/algorithms', methods=['GET','POST'])
def algorithms():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url))
    template_context = {
                'my_id': 'algorithms.html',
                'course': 'data-structures',
                'nav_items': nav_items
            }
    
    return render_template('data_structures/algorithms.html', **template_context)



@bp.route('/submissions', methods=['GET','POST'])
def submissions():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url))
    template_context = {
                'my_id': 'algorithms.html',
                'course': 'data-structures',
                'nav_items': nav_items
            }
    
    return render_template('data_structures/submissions.html', **template_context)



