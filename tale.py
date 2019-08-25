# -*- coding: utf-8 -*-

import jinja2
import os
import webapp2

jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))


class TaleHandler(webapp2.RequestHandler):
    def get(self,my_id):
        #the_comp = ['EE.PK', 'EE.LO', 'EE.LVS/LVT', 'LV.NO', 'LV.VO', 'LV.AO']
        main_tales = [
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
                'id':'Comb.GamesSymmetry', 
                'dir':'comb-games-symmetry',
                'title': u'Simetrija spēlēs'
            },
            
        ]
        remaining_tales = [
            {
                'id':'R.Intro', 
                'dir':'r-language-intro',
                'title': u'Valodas R ievads'
            },
            {
                'id':'NumTh.Grade10', 
                'dir':'stories-nt-grade10',
                'title': u'10.klases mix'
            },
            {
                'id':'NumTh.Multiplicative', 
                'dir':'numtheory-multiplicative',
                'title': u'Multiplikatīva teorija' 
            }
        ]

        
        template_context = {
            'main_tales': main_tales,    
            'remaining_tales': remaining_tales
        }            
        template = jinja_env.get_template('tale/index.html')
        output = template.render(template_context)
        self.response.out.write(output.encode('utf-8'))


app = webapp2.WSGIApplication([    
    ('/tale/(.*)', TaleHandler)
], debug=True)



