# -*- coding: utf-8 -*-

import jinja2
import os
import webapp2
import json

jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))


class DiscreteHandler(webapp2.RequestHandler):   
    readings = [
        {
            'title':'Algorithms for Large Primes', 
            'name':'TBA',
            'description': 'It would be highly inefficient to search for ' +
            'prime numbers with a full search algorithm such as the ' + 
            'Sieve of Eratosthenes or testing divisibility up to the square root. ' + 
            'Nevertheless, large primes are important for cryptography and other applications. ' + 
            'There are several efficient algorithms for primality testing.',
            'links': [
                {
                    'url': 'https://bit.ly/2tx7Iub',
                    'title': 'The Sieve of Eratosthenes',
                    'note': 'An ancient algorithm to build a list of primes in a large interval'
                },
                {
                    'url': 'https://bit.ly/2uhos8L',
                    'title': 'Miller-Rabin primality test',
                    'note': 'Most practical and widely used algorithm is probabilistic. ' +
                    'It may falsely claim that a composite number is prime with a small probability. ' +
                    'The error can be made as small as you want, if you run sufficiently many tests.'
                }
            ]
        }
    ]

    def get(self,my_id):
        with open('data/global_navigation.json') as f1:
            nav_items = json.load(f1)
        with open('data/discrete_readings.json') as f2:
            my_readings = json.load(f2)
        with open('data/discrete_index.json') as f3:
            indexItems = json.load(f3) 

            
        abc = ['-','a','b','c','d','e','f','g','h','i','j',
               'k','l','m','n','o','p','q','r','s','t',
               'u','v','w','x','y','z']
        
        if (my_id == 'index.html'):
            template_context = {
                'my_id': my_id,
                'course': 'discrete',
                'nav_items': nav_items,
                'indexItems': indexItems,
                'abc': abc 
            }
            template = jinja_env.get_template('discrete/index.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'coq.html'):
            template_context = {
                'my_id': my_id,
                'course': 'discrete',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('discrete/coq.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'presentations.html'):
            template_context = {
                'my_id': my_id,
                'course': 'discrete',
                'nav_items': nav_items,
                'readings': my_readings
            }
            template = jinja_env.get_template('discrete/presentations.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'proofs.html'):     
            template_context = {
                'my_id': my_id,
                'course': 'discrete',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('discrete/proofs.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'assignments.html'):
            template_context = {
                'my_id': my_id,
                'course': 'discrete',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('discrete/assignments.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'sources.html'):
            template_context = {
                'my_id': my_id,
                'course': 'discrete',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('discrete/sources.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        else: 
            self.response.set_status(404)


app = webapp2.WSGIApplication([    
    ('/discrete/(.*)', DiscreteHandler)
], debug=True)



