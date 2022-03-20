# -*- coding: utf-8 -*-

import functools, os

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for, json, current_app
)
#from werkzeug.security import check_password_hash, generate_password_hash

#from ddgatve.db import get_db

bp = Blueprint('onlinetests', __name__, url_prefix='/onlinetests')





@bp.route('/onlinetests', methods=['GET', 'POST'])
def index():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url, encoding='utf-8'))
    template_context = {
        'my_id': 'index',
        'course': 'onlinetests',
        'nav_items': nav_items
    } 
    return render_template('onlinetests/index.html', **template_context)


@bp.route('/onlinetests', methods=['GET', 'POST'])
def current():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url, encoding='utf-8'))
    template_context = {
        'my_id': 'assignments',
        'course': 'onlinetests',
        'nav_items': nav_items
    }
    return render_template('onlinetests/current.html', **template_context)


@bp.route('/onlinetests', methods=['GET', 'POST'])
def archive():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url, encoding='utf-8'))
    template_context = {
        'my_id': 'archive',
        'course': 'onlinetests',
        'nav_items': nav_items
    }
    return render_template('onlinetests/archive.html', **template_context)



