# -*- coding: utf-8 -*-

import jinja2
import os
import webapp2
import json

jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))


class DataStructuresHandler(webapp2.RequestHandler):
    
    presentations = [
        {
            'id':'Algorithms.Lossless1', 
            'dir':'data-structures-lossless-part1',
            'title': u'Bezzudumu saspiešana - 1',
            'date': '2019-09-03'
        }    
    ]       
   


    def get(self,my_id):
        with open('data/global_navigation.json') as f1:
            nav_items = json.load(f1)
        with open('data/data_structures_index.json') as f3:
            indexItems = json.load(f3) 

            
        abc = ['-','a','b','c','d','e','f','g','h','i','j',
               'k','l','m','n','o','p','q','r','s','t',
               'u','v','w','x','y','z']
        
        if (my_id == 'index.html'):
            template_context = {
                'my_id': my_id,
                'course': 'data-structures',
                'nav_items': nav_items,
                'indexItems': indexItems,
            }
            template = jinja_env.get_template('data-structures/index.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'cpp.html'):
            template_context = {
                'my_id': my_id,
                'course': 'data-structures',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('data-structures/cpp.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'presentations.html'):
            template_context = {
                'my_id': my_id,
                'course': 'data-structures',
                'presentations': self.presentations, 
                'nav_items': nav_items
            }
            template = jinja_env.get_template('data-structures/presentations.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'algorithms.html'):     
            template_context = {
                'my_id': my_id,
                'course': 'data-structures',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('data-structures/algorithms.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'assignments.html'):
            template_context = {
                'my_id': my_id,
                'course': 'discrete',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('data-structures/assignments.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'references.html'):
            template_context = {
                'my_id': my_id,
                'course': 'data-structures',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('data-structures/references.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        else: 
            self.response.set_status(404)


app = webapp2.WSGIApplication([    
    ('/data-structures/(.*)', DataStructuresHandler)
], debug=True)



