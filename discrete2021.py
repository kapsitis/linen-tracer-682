# -*- coding: utf-8 -*-

import jinja2
import os
import webapp2
import json

jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))


class Discrete2021Handler(webapp2.RequestHandler):   

    def get(self,my_id):
        with open('data/global_navigation.json') as f1:
            nav_items = json.load(f1)
        #with open('data/discrete_readings.json') as f2:
        #    my_readings = json.load(f2)
        with open('data/discrete2021_topics.json') as f3:
            indexItems = json.load(f3) 

            
        abc = ['-','a','b','c','d','e','f','g','h','i','j',
               'k','l','m','n','o','p','q','r','s','t',
               'u','v','w','x','y','z']
        
        if (my_id == 'index.html'):
            template_context = {
                'my_id': my_id,
                'course': 'discrete2021',
                'nav_items': nav_items,
                'indexItems': indexItems,
                'abc': abc 
            }
            template = jinja_env.get_template('discrete2021/index.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'coq.html'):
            template_context = {
                'my_id': my_id,
                'course': 'discrete2021',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('discrete2021/coq.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'presentations.html'):
            template_context = {
                'my_id': my_id,
                'course': 'discrete2021',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('discrete2021/presentations.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'summaries.html'):     
            template_context = {
                'my_id': my_id,
                'course': 'discrete2021',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('discrete2021/summaries.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'assignments.html'):
            template_context = {
                'my_id': my_id,
                'course': 'discrete2021',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('discrete2021/assignments.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'sources.html'):
            template_context = {
                'my_id': my_id,
                'course': 'discrete2021',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('discrete2021/sources.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        else: 
            self.response.set_status(404)


app = webapp2.WSGIApplication([    
    ('/discrete2021/(.*)', Discrete2021Handler)
], debug=True)



