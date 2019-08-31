# -*- coding: utf-8 -*-

import jinja2
import os
import webapp2

jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))


class NumtheoryHandler(webapp2.RequestHandler):
    local_tales = [
        {
            'id':'NumTh.ArithmProgressions', 
            'dir':'numtheory-arithm-progressions',
            'title': u'Aritmētiskas progresijas'
        },
        {
            'id':'NumTh.GeomProgressions', 
            'dir':'numtheory-geom-progressions',
            'title': u'Ģeometriskas progresijas'
        },
        {
            'id':'NumTh.PeriodicSequences', 
            'dir':'numtheory-recurrence-relation',
            'title': u'Rekurentu virkņu periodiskums'
        },
        {
            'id':'NumTh.Grade10', 
            'dir':'stories-nt-grade10',
            'title': u'10.klases mix'
        },
        {
            'id':'Comb.GamesSymmetry', 
            'dir':'comb-games-symmetry',
            'title': u'Simetrija spēlēs'
        },
    
    ]
        
    global_tales = [
        {
            'id':'NumTh.Multiplicative', 
            'dir':'numtheory-multiplicative',
            'title': u'Multiplikatīva teorija' 
        }
    ]

    exam_lst = [
        {
            'id':'G10.ALG', 
            'dir':'nt10-algebra',
            'title': u'Algebras prasmes'
        },
        {
            'id':'G10.MOD', 
            'dir':'nt10-modular-arithmetic',
            'title': u'Modulārās aritmētikas prasmes'
        }
    ]

    
    def get(self,my_id):
        
        if (my_id == 'index.html'):
            template_context = {
                'my_id': my_id
            }
            template = jinja_env.get_template('numtheory/index.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'tales.html'):
            
            template_context = {
                'local_tales': self.local_tales,
                'global_tales': self.global_tales,
                'my_id': my_id
            }
            template = jinja_env.get_template('numtheory/tales.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'references.html'):
            template_context = {
                'my_id': my_id
            }
            template = jinja_env.get_template('numtheory/references.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'problems.html'):
            template_context = {
                'my_id': my_id
            }
            template = jinja_env.get_template('numtheory/problems.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'exams.html'):
            template_context = {
                'my_id': my_id,
                'lst_comp': self.exam_lst
            }
            template = jinja_env.get_template('numtheory/exams.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        else: 
            self.response.set_status(404)
            

app = webapp2.WSGIApplication([    
    ('/numtheory/(.*)', NumtheoryHandler)
], debug=True)



