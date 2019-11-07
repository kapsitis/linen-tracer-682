# -*- coding: utf-8 -*-

import jinja2
import os
import webapp2
import json

jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))


class RbsHandler(webapp2.RequestHandler):
    
    tales = [
        {
            'id':'RBS.ProjectProcesses', 
            'dir':'project-processes',
            'title': u'Project Processes'
        },
        {
            'id':'RBS.ProjectProcesses', 
            'dir':'technical-design',
            'title': u'Technical Design'
        }

    ]
    
    other_tales = [
        {
            'id':'RBS.AboutBITL',
            'dir':'about-bitl',
            'title': 'First Year of BITL'
        },
        {
            'id':'RBS.YouTube1',
            'dir':'youtube-data-part1',
            'title': 'YouTube Data for (Prospective) Authors - 1'
        },
        {
            'id':'RBS.YouTube2',
            'dir':'youtube-data-part2',
            'title': 'YouTube Data for (Prospective) Authors - 2'
        }

    ]
    
    def get(self,my_id):
        with open('data/global_navigation.json') as f1:
            nav_items = json.load(f1)
        if (my_id == 'index.html'):
            template_context = {
                'my_id': my_id,
                'course': 'rbs',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('rbs/index.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'slides.html'):
            template_context = {
                'my_id': my_id,
                'course': 'rbs',
                'tales': self.tales, 
                'other_tales': self.other_tales,
                'nav_items': nav_items
            }
            template = jinja_env.get_template('rbs/slides.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'polls.html'):     
            template_context = {
                'my_id': my_id,
                'course': 'rbs',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('rbs/polls.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'tasks.html'):
            template_context = {
                'my_id': my_id,
                'course': 'rbs',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('rbs/tasks.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'references.html'):
            template_context = {
                'my_id': my_id,
                'course': 'rbs',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('rbs/references.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        else: 
            self.response.set_status(404)


app = webapp2.WSGIApplication([    
    ('/rbs/(.*)', RbsHandler)
], debug=True)



