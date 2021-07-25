import functools, os

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for, json, current_app
)
#from werkzeug.security import check_password_hash, generate_password_hash

#from ddgatve.db import get_db

bp = Blueprint('discrete_spring2020', __name__, url_prefix='/discrete-spring2020')

@bp.route('/index', methods=['GET', 'POST'])
def index():
    abc = ['-','a','b','c','d','e','f','g','h','i','j',
               'k','l','m','n','o','p','q','r','s','t',
               'u','v','w','x','y','z']
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url))    
    json_url = os.path.join(current_app.root_path, 'static/data', 'discrete_spring2020_topics.json')
    indexItems = json.load(open(json_url))
    template_context = {
        'my_id': 'index.html',
        'course': 'discrete-spring2020',
        'nav_items': nav_items,
        'indexItems': indexItems,
        'abc': abc 
    }
    return render_template('discrete_spring2020/index.html', **template_context)


@bp.route('/assignments', methods=['GET','POST'])
def assignments():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url))
    template_context = {
        'my_id': 'assignments.html',
        'course': 'discrete-spring2020',
        'nav_items': nav_items
    }
    return render_template('discrete_spring2020/assignments.html', **template_context)


@bp.route('/coq', methods=['GET','POST'])
def slides():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url))
    template_context = {
        'my_id': 'coq.html',
        'course': 'discrete-spring2020',
        'nav_items': nav_items
    }
    return render_template('discrete_spring2020/coq.html', **template_context)


@bp.route('/proofs', methods=['GET','POST'])
def algorithms():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url))
    template_context = {
        'my_id': 'proofs.html',
        'course': 'discrete-spring2020',
        'nav_items': nav_items
    } 
    return render_template('discrete_spring2020/proofs.html', **template_context)



@bp.route('/presentations', methods=['GET','POST'])
def submissions():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url))
    readings_url = os.path.join(current_app.root_path, 'static/data', 'discrete_spring2020_readings.json')
    my_readings = json.load(open(readings_url))        
    template_context = {
        'my_id': 'presentations.html',
        'course': 'discrete-spring2020',
        'readings': my_readings,
        'nav_items': nav_items
    }
    return render_template('discrete_spring2020/presentations.html', **template_context)



