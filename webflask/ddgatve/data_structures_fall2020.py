import functools, os

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for, json, current_app
)
#from werkzeug.security import check_password_hash, generate_password_hash

#from ddgatve.db import get_db

bp = Blueprint('data_structures_fall2020', __name__, url_prefix='/data-structures-fall2020')

global_nav_items = None

def getNavigItems(rootPath):
    global global_nav_items
    if global_nav_items == None:
        navig_url = os.path.join(rootPath, 'static/data', 'global_navigation.json')
        global_nav_items = json.load(open(navig_url))
    return global_nav_items


@bp.route('/index', methods=['GET', 'POST'])
def index():
    json_url = os.path.join(current_app.root_path, 'static/data', 'data_structures_fall2020_topics.json')
    jsonTopics = json.load(open(json_url))
    template_context = {
        'my_id': 'index',
        'course': 'data-structures-fall2020',
        'nav_items': getNavigItems(current_app.root_path),
        'jsonTopics': jsonTopics
    }
    return render_template('data_structures_fall2020/index.html', **template_context)


@bp.route('/assignments', methods=['GET','POST'])
def assignments():
    template_context = {
        'my_id': 'assignments',
        'course': 'data-structures-fall2020',
        'nav_items': getNavigItems(current_app.root_path)
    }
    return render_template('data_structures_fall2020/assignments.html', **template_context)


@bp.route('/slides', methods=['GET','POST'])
def slides():
    modules_url = os.path.join(current_app.root_path, 'static/data', 'data_structures_fall2020_modules.json')
    jsonModules = json.load(open(modules_url))
    template_context = {
        'my_id': 'slides',
        'course': 'data-structures-fall2020',
        'jsonModules': jsonModules,
        'nav_items': getNavigItems(current_app.root_path)
    }
    
    return render_template('data_structures_fall2020/slides.html', **template_context)


@bp.route('/algorithms', methods=['GET','POST'])
def algorithms():
    template_context = {
        'my_id': 'algorithms',
        'course': 'data-structures-fall2020',
        'nav_items': getNavigItems(current_app.root_path)
    }
    
    return render_template('data_structures_fall2020/algorithms.html', **template_context)



@bp.route('/submissions', methods=['GET','POST'])
def submissions():
    grading_url = os.path.join(current_app.root_path, 'static/data', 'data_structures_fall2020_grading.json')
    gradingStuff = json.load(open(grading_url))
    template_context = {
        'my_id': 'submissions',
        'course': 'data-structures-fall2020',
        'gradingStuff': gradingStuff,
        'nav_items': getNavigItems(current_app.root_path)
    }
    return render_template('data_structures_fall2020/submissions.html', **template_context)



