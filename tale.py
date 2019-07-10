# -*- coding: utf-8 -*-

import jinja2
import os
import webapp2

jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))


class TaleHandler(webapp2.RequestHandler):
    def get(self,my_id):
        #the_comp = ['EE.PK', 'EE.LO', 'EE.LVS/LVT', 'LV.NO', 'LV.VO', 'LV.AO']
        the_tales = [
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
            'the_tales': the_tales
        }            
        template = jinja_env.get_template('tale/index.html')
        output = template.render(template_context)
        self.response.out.write(output.encode('utf-8'))


app = webapp2.WSGIApplication([    
    ('/tale/(.*)', TaleHandler)
], debug=True)



