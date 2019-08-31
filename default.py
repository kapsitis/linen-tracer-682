# -*- coding: utf-8 -*-

import jinja2
import os
import webapp2

jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))

class DefaultHandler(webapp2.RequestHandler):
 
    
    def get(self,my_id):
        
        if (my_id == 'index.html'):
            template_context = {
                'my_id': my_id
            }
            template = jinja_env.get_template('default/index.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'tales.html'):            
            template_context = {
                'my_id': my_id
            }
            template = jinja_env.get_template('default/tales.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'references.html'):
            template_context = {
                'my_id': my_id
            }
            template = jinja_env.get_template('default/references.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'problems.html'):
            template_context = {
                'my_id': my_id
            }
            template = jinja_env.get_template('default/problems.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'exams.html'):
            template_context = {
                'my_id': my_id,
            }
            template = jinja_env.get_template('default/exams.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        else: 
            self.response.set_status(404)
            

app = webapp2.WSGIApplication([    
    ('/default/(.*)', DefaultHandler)
], debug=True)



