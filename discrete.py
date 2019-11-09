# -*- coding: utf-8 -*-

import jinja2
import os
import webapp2
import json

jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))


class DiscreteHandler(webapp2.RequestHandler):   
    tales = [
    ]
    
    other_tales = [
    ]
    
    def get(self,my_id):
        with open('data/global_navigation.json') as f1:
            nav_items = json.load(f1)
        if (my_id == 'index.html'):
            template_context = {
                'my_id': my_id,
                'course': 'discrete',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('discrete/index.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'slides.html'):
            template_context = {
                'my_id': my_id,
                'course': 'discrete',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('discrete/slides.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'polls.html'):     
            template_context = {
                'my_id': my_id,
                'course': 'discrete',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('discrete/polls.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'tasks.html'):
            template_context = {
                'my_id': my_id,
                'course': 'discrete',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('discrete/tasks.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'references.html'):
            template_context = {
                'my_id': my_id,
                'course': 'discrete',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('discrete/references.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        else: 
            self.response.set_status(404)


app = webapp2.WSGIApplication([    
    ('/discrete/(.*)', DiscreteHandler)
], debug=True)



