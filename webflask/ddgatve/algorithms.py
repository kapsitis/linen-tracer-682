# -*- coding: utf-8 -*-

import functools, os

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for, json, current_app
)
#from werkzeug.security import check_password_hash, generate_password_hash

#from ddgatve.db import get_db

bp = Blueprint('algorithms', __name__, url_prefix='/algorithms')

@bp.route('/index', methods=['GET', 'POST'])
def index():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url, encoding='utf-8'))
    json_url = os.path.join(current_app.root_path, 'static/data', 'algorithms_topics.json')
    jsonTopics = json.load(open(json_url, encoding='utf-8'))
    template_context = {
                'my_id': 'index',
                'course': 'algorithms',
                'nav_items': nav_items,
                'jsonTopics': jsonTopics
            }
    
    return render_template('algorithms/index.html', **template_context)


@bp.route('/assignments', methods=['GET','POST'])
def assignments():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url, encoding='utf-8'))
    template_context = {
                'my_id': 'assignments',
                'course': 'algorithms',
                'nav_items': nav_items
            }
    
    return render_template('algorithms/assignments.html', **template_context)


@bp.route('/slides', methods=['GET','POST'])
def slides():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url, encoding='utf-8'))
    modules_url = os.path.join(current_app.root_path, 'static/data', 'algorithms_modules.json')
    jsonModules = json.load(open(modules_url, encoding='utf-8'))
    template_context = {
        'my_id': 'slides',
        'course': 'algorithms',
        'jsonModules': jsonModules,
        'nav_items': nav_items
    }
    
    return render_template('algorithms/slides.html', **template_context)


@bp.route('/indices', methods=['GET','POST'])
def algorithms():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url, encoding='utf-8'))
    template_context = {
                'my_id': 'algorithms',
                'course': 'algorithms',
                'nav_items': nav_items
            }
    
    return render_template('algorithms/indices.html', **template_context)



@bp.route('/coding', methods=['GET','POST'])
def submissions():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url, encoding='utf-8'))
    template_context = {
                'my_id': 'coding',
                'course': 'algorithms',
                'nav_items': nav_items
            }
    
    return render_template('algorithms/coding.html', **template_context)



