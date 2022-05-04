# -*- coding: utf-8 -*-

import functools, os

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for, json, current_app
)
#from werkzeug.security import check_password_hash, generate_password_hash

#from ddgatve.db import get_db

bp = Blueprint('discrete_spring2022', __name__, url_prefix='/discrete-spring2022')

@bp.route('/index', methods=['GET', 'POST'])
def index():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url, encoding='utf-8'))
    json_url = os.path.join(current_app.root_path, 'static/data', 'discrete2022_topics.json')
    jsonTopics = json.load(open(json_url, encoding='utf-8'))
    template_context = {
        'my_id': 'index',
        'course': 'discrete-spring2022',
        'nav_items': nav_items,
        'jsonTopics': jsonTopics
    }
    return render_template('discrete_spring2022/index.html', **template_context)


@bp.route('/assignments', methods=['GET','POST'])
def assignments():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url, encoding='utf-8'))
    template_context = {
        'my_id': 'assignments',
        'course': 'discrete-spring2022',
        'nav_items': nav_items
    }
    return render_template('discrete_spring2022/assignments.html', **template_context)


@bp.route('/quizzes', methods=['GET','POST'])
def quizzes():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url, encoding='utf-8'))
    template_context = {
        'my_id': 'quizzes',
        'course': 'discrete-spring2022',
        'nav_items': nav_items
    }
    return render_template('discrete_spring2022/quizzes.html', **template_context)



