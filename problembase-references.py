# -*- coding: utf-8 -*-

import jinja2
import json
import os
import re
import webapp2

jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))


class ProblembaseReferencesHandler(webapp2.RequestHandler):    
    
    def get(self,my_id):
        template_context = {
            'my_id': my_id,
            'title': u'Uzdevumu DB: Norādes'            
        }
        template = jinja_env.get_template('problembase/references.html')
        output = template.render(template_context)
        self.response.out.write(output.encode('utf-8'))

app = webapp2.WSGIApplication([    
    ('/problembase/(.*)', ProblembaseReferencesHandler)
], debug=True)



