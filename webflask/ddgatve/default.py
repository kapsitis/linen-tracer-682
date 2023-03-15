# -*- coding: utf-8 -*-

import functools, os

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for, json, current_app
)


#from werkzeug.exceptions import abort

#from ddgatve.auth import login_required


bp = Blueprint('default', __name__)

@bp.route('/')
def index():
    template_context = {
        'my_id': 'index',
        'course': 'default'
    }
    return render_template('default/index.html', **template_context)

