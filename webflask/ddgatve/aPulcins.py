# -*- coding: utf-8 -*-

import functools, os

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for, json, current_app
)

bp = Blueprint('aPulcins', __name__, url_prefix='/aPulcins')

@bp.route('/index', methods=['GET', 'POST'])
def index():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url, encoding='utf-8'))
    json_url = os.path.join(current_app.root_path, 'static/data', 'algorithms_topics.json')
    jsonTopics = json.load(open(json_url, encoding='utf-8'))
    template_context = {
                'my_id': 'index',
                'course': 'aPulcins',
                'nav_items': nav_items
            }
    
    return render_template('aPulcins/index.html', **template_context)


@bp.route('/worksheets', methods=['GET','POST'])
def assignments():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url, encoding='utf-8'))
    template_context = {
        'my_id': 'worksheets',
        'course': 'aPulcins',
        'nav_items': nav_items
    }
    return render_template('aPulcins/worksheets.html', **template_context)
