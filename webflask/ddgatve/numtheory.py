# -*- coding: utf-8 -*-

import functools, os

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for, json, current_app
)
#from werkzeug.security import check_password_hash, generate_password_hash

#from ddgatve.db import get_db

bp = Blueprint('numtheory', __name__, url_prefix='/numtheory')



local_tales = [
        {
            'id':'NumTh.ArithmProgressions', 
            'dir':'tale-numtheory-arithm-progressions',
            'title': u'Aritmētiskas progresijas'
        },
        {
            'id':'NumTh.GeomProgressions', 
            'dir':'tale-numtheory-geom-progressions',
            'title': u'Ģeometriskas progresijas'
        },
        {
            'id':'NumTh.PeriodicSequences', 
            'dir':'numtheory-recurrence-relation',
            'title': u'Rekurentu virkņu periodiskums'
        },
        {
            'id':'NumTh.Grade10', 
            'dir':'tale-numtheory-grade10',
            'title': u'10.klases mix'
        },
        {
            'id':'Comb.GamesSymmetry', 
            'dir':'tale-numtheory-games-symmetry',
            'title': u'Simetrija spēlēs'
        },
        {
            'id':'NumTh.Multiplicative', 
            'dir':'tale-numtheory-multiplicative',
            'title': u'Multiplikatīva teorija (pārtaisāms)',
            'date': '2019-06-10'
        }    
]
        

global_tales = [
        {
            'id':'NumTh.JunIntro',
            'dir':'tale-numtheory-jun-intro',
            'title': u'Jun00: Ievadlekcija',
            'date': '2019-09-14'
        },
        {
            'id':'NumTh.Jun01',
            'dir':'tale-numtheory-jun01-divisibility',
            'title': u'Jun01: Pirmskaitļi un dalāmība',
            'date': '2019-09-28'
        },
#        {
#            'id':'NumTh.Jun03',
#            'dir':'tale-numtheory-jun02-congruences',
#            'title': u'Jun02: Modulārā aritmētika',
#            'date': '2019-09-28',
#            'nolink' : 'True'
#        },        
        {
            'id':'NumTh.Jun02',
            'dir':'tale-numtheory-jun03-crt',
            'title': u'Jun02: Ķīniešu atlikumu teorēma',
            'date': '2019-12-14'
        }
#        {
#            'id':'NumTh.Jun04',
#            'dir':'tale-numtheory-jun04-valuations',
#            'title': u'Jun04: Valuācijas',
#            'date': '2019-12-14',
#            'nolink': 'True'
#        }
]


exam_lst = [
        {
            'id':'G10.ALG', 
            'dir':'exam-numtheory-algebra',
            'title': u'Algebras prasmes'
        },
        {
            'id':'G10.MOD', 
            'dir':'exam-numtheory-modular-arithmetic',
            'title': u'Modulārās aritmētikas prasmes'
        }
]



@bp.route('/index', methods=['GET', 'POST'])
def index():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url))
    template_context = {
        'my_id': 'index',
        'course': 'numtheory',
        'nav_items': nav_items
    } 
    return render_template('numtheory/index.html', **template_context)


@bp.route('/assignments', methods=['GET','POST'])
def assignments():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url))
    template_context = {
        'my_id': 'assignments',
        'course': 'numtheory',
        'nav_items': nav_items
    }
    return render_template('numtheory/assignments.html', **template_context)


@bp.route('/slides', methods=['GET','POST'])
def slides():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url))
    template_context = {
        'local_tales': local_tales,
        'global_tales': global_tales,
        'my_id': 'slides',
        'course': 'numtheory',
        'nav_items': nav_items
    }
    return render_template('numtheory/slides.html', **template_context)


@bp.route('/exams', methods=['GET','POST'])
def algorithms():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url))
    template_context = {
        'lst_comp': exam_lst,
        'my_id': 'exams',
        'course': 'numtheory',
        'nav_items': nav_items
    } 
    return render_template('numtheory/exams.html', **template_context)



@bp.route('/references', methods=['GET','POST'])
def submissions():
    navig_url = os.path.join(current_app.root_path, 'static/data', 'global_navigation.json')
    nav_items = json.load(open(navig_url))
    template_context = {
        'my_id': 'references',
        'course': 'numtheory',
        'nav_items': nav_items
    }
    return render_template('numtheory/references.html', **template_context)



