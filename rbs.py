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
            'dir':'week03-development-by-a-team',
            'title': u'(Week03, 2020-09-18) Development by a Team'
        },
        {
            'id':'RBS.DesignDocuments', 
            'dir':'technical-design',
            'title': u'(Week06, 2019-10-11) Design Documents'
        },
        {
            'id':'RBS.PlanningIterations', 
            'dir':'planning-iterations',
            'title': u'(Week10, 2019-11-08) Planning Iterations'
        }

    ]
    
    other_tales = [
        {
            'id':'RBS.SearchingInternet',
            'dir':'searching-internet',
            'title': 'Searching the Internet (2019-11-13)'
        },
        {
            'id':'RBS.AboutBITL',
            'dir':'about-bitl',
            'title': 'About BITL Program (in Latvian; for Junior Achievement Teachers, 2019-11-07)'
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
        elif (my_id == 'bauska.html'):     
            template_context = {
                'my_id': my_id,
                'course': 'rbs',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('rbs/bauska.html')
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



