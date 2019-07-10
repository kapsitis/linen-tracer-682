# -*- coding: utf-8 -*-

import jinja2
import os
import webapp2

jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))


class ExamHandler(webapp2.RequestHandler):
    def get(self,my_id):
        #the_comp = ['EE.PK', 'EE.LO', 'EE.LVS/LVT', 'LV.NO', 'LV.VO', 'LV.AO']
        the_comp = [
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

        
        template_context = {                
            'lst_comp': the_comp
        }            
        template = jinja_env.get_template('exam/index.html')
        output = template.render(template_context)
        self.response.out.write(output.encode('utf-8'))
            


app = webapp2.WSGIApplication([    
    ('/exam/(.*)', ExamHandler)
], debug=True)



