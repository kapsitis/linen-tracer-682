# -*- coding: utf-8 -*-

import jinja2
import json
import os
import re
import webapp2

jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))


class ProblembaseIndexHandler(webapp2.RequestHandler):    
    
    def get(self,my_id):
        with open('data/global_navigation.json') as f1:
            nav_items = json.load(f1)                
        template_context = {
            'my_id': my_id,
            'title': u'Uzdevumu DB: Sākumlapa',
            'course': 'problembase',
            'nav_items': nav_items    
        }
        template = jinja_env.get_template('problembase/index.html')
        output = template.render(template_context)
        self.response.out.write(output.encode('utf-8'))

app = webapp2.WSGIApplication([    
    ('/problembase/(.*)', ProblembaseIndexHandler)
], debug=True)



