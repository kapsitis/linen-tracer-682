# -*- coding: utf-8 -*-

## DEPRECATED
##

import jinja2
import json
import os
import re
import webapp2

jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))


class ProblembaseReportsQtypesHandler(webapp2.RequestHandler):    
    
    def get(self,my_id):
        template_context = {                
            'title': u'Uzdevumu DB: Jautājumu tipu pārskats'
        }            
     
        template = jinja_env.get_template('problembase/reports-qtypes.html')
        output = template.render(template_context)
        self.response.out.write(output.encode('utf-8'))

app = webapp2.WSGIApplication([    
    ('/problembase/(.*)', ProblembaseReportsQtypesHandler)
], debug=True)



