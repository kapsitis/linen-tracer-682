# -*- coding: utf-8 -*-

import jinja2
import os
import webapp2
import json

jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))


class NumtheoryHandler(webapp2.RequestHandler):
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
        {
            'id':'NumTh.Multiplicative', 
            'dir':'tale-numtheory-multiplicative',
            'title': u'Multiplikatīva teorija (pārtaisāms)',
            'date': '2019-06-10'
        }
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

    
    def get(self,my_id):
        with open('data/global_navigation.json') as f1:
            nav_items = json.load(f1)        
        if (my_id == 'index.html'):
            template_context = {
                'my_id': my_id,
                'course': 'numtheory', 
                'nav_items': nav_items
            }
            template = jinja_env.get_template('numtheory/index.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'tales.html'):            
            template_context = {
                'local_tales': self.local_tales,
                'global_tales': self.global_tales,
                'my_id': my_id,
                'course': 'numtheory', 
                'nav_items': nav_items                
            }
            template = jinja_env.get_template('numtheory/tales.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'references.html'):
            template_context = {
                'my_id': my_id,
                'course': 'numtheory', 
                'nav_items': nav_items                
            }
            template = jinja_env.get_template('numtheory/references.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'problems.html'):
            template_context = {
                'my_id': my_id,
                'course': 'numtheory', 
                'nav_items': nav_items                
            }
            template = jinja_env.get_template('numtheory/problems.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'exams.html'):
            template_context = {
                'my_id': my_id,
                'lst_comp': self.exam_lst,
                'course': 'numtheory', 
                'nav_items': nav_items                
            }
            template = jinja_env.get_template('numtheory/exams.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        else: 
            self.response.set_status(404)
            

app = webapp2.WSGIApplication([    
    ('/numtheory/(.*)', NumtheoryHandler)
], debug=True)



