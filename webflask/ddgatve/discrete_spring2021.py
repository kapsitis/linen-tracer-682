# -*- coding: utf-8 -*-

import functools, os

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for, json, current_app
)
#from werkzeug.security import check_password_hash, generate_password_hash

#from ddgatve.db import get_db

bp = Blueprint('discrete_spring2021', __name__, url_prefix='/discrete-spring2021')

@bp.route('/index', methods=['GET', 'POST'])
def index():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url, encoding='utf-8'))
    json_url = os.path.join(current_app.root_path, 'static/data', 'discrete2021_topics.json')
    jsonTopics = json.load(open(json_url, encoding='utf-8'))
    template_context = {
        'my_id': 'index',
        'course': 'discrete-spring2021',
        'nav_items': nav_items,
        'jsonTopics': jsonTopics
    }
    return render_template('discrete_spring2021/index.html', **template_context)


@bp.route('/assignments', methods=['GET','POST'])
def assignments():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url, encoding='utf-8'))
    template_context = {
        'my_id': 'assignments',
        'course': 'discrete-spring2021',
        'nav_items': nav_items
    }
    return render_template('discrete_spring2021/assignments.html', **template_context)


@bp.route('/coq', methods=['GET','POST'])
def slides():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url, encoding='utf-8'))
    template_context = {
        'my_id': 'coq',
        'course': 'discrete-spring2021',
        'nav_items': nav_items
    }
    return render_template('discrete_spring2021/coq.html', **template_context)


@bp.route('/summaries', methods=['GET','POST'])
def algorithms():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url, encoding='utf-8'))
    template_context = {
        'my_id': 'summaries',
        'course': 'discrete-spring2021',
        'nav_items': nav_items
    } 
    return render_template('discrete_spring2021/summaries.html', **template_context)



@bp.route('/references', methods=['GET','POST'])
def submissions():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url, encoding='utf-8'))
    template_context = {
        'my_id': 'references',
        'course': 'discrete-spring2021',
        'nav_items': nav_items
    }
    return render_template('discrete_spring2021/references.html', **template_context)



