# -*- coding: utf-8 -*-

import jinja2
import os
import webapp2
import json

jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))

class VisualizationsHandler(webapp2.RequestHandler):

#    tales = [
#        {
#            'id':'Visualizations.RIntro', 
#            'dir':'r-language-intro',
#            'title': u'Valodas R ievads'
#        }
#    ]         
 
    
    def get(self,my_id):
        with open('data/global_navigation.json') as f1:
            nav_items = json.load(f1)                
        if (my_id == 'index.html'):
            template_context = {
                'my_id': my_id,
                'course': 'visualizations',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('visualizations/index.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'tales.html'):            
            template_context = {
                'my_id': my_id,
                'course': 'visualizations',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('visualizations/tales.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'references.html'):
            template_context = {
                'my_id': my_id,
                'course': 'visualizations',
                'nav_items': nav_items                
            }
            template = jinja_env.get_template('visualizations/references.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'problems.html'):
            template_context = {
                'my_id': my_id,
                'course': 'visualizations',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('visualizations/problems.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'exams.html'):
            template_context = {
                'my_id': my_id,
                'course': 'visualizations',
                'nav_items': nav_items                
            }
            template = jinja_env.get_template('visualizations/exams.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        else: 
            self.response.set_status(404)
            

app = webapp2.WSGIApplication([    
    ('/visualizations/(.*)', VisualizationsHandler)
], debug=True)



