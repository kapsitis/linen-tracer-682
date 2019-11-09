# -*- coding: utf-8 -*-

import jinja2
import os
import webapp2
import json

jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))


class AlgorithmsHandler(webapp2.RequestHandler):
    
    tales = [
        {
            'id':'Algorithms.Lossless1', 
            'dir':'tale-algorithms-lossless-part1',
            'title': u'Bezzudumu saspiešana - 1'
        },
        {
            'id':'Algorithms.Lossless2', 
            'dir':'tale-algorithms-lossless-part2',
            'title': u'Bezzudumu saspiešana - 2'
        },
        {
            'id':'Algorithms.Lossless3', 
            'dir':'tale-algorithms-lossless-part3',
            'title': u'Bezzudumu saspiešana - 3'
        },
        {
            'id':'Algorithms.Lossy1',
            'dir':'tale-algorithms-lossy-part1',
            'title': u'Zudumradošā saspiešana - 1'
        },
        {
            'id':'Algorithms.Lossy2',
            'dir':'tale-algorithms-lossy-part2',
            'title': u'Zudumradošā saspiešana - 2'
        },
        {
            'id':'Algorithms.ErrorCorrection1',
            'dir':'tale-error-correction-part1',
            'title': u'Kļūdu labošanas algoritmi - 1'
        },
        {
            'id':'Algorithms.ErrorCorrection2',
            'dir':'tale-error-correction-part2',
            'title': u'Kļūdu labošanas algoritmi - 2'
        },
        {
            'id':'Algorithms.AsymmetricCryptography',
            'dir':'tale-asymmetric-cryptography-part1',
            'title': u'Asimetriskā kriptogrāfija - 1'
        },
        {
            'id':'Algorithms.LinearOptimization1',
            'dir':'tale-linear-optimization-part1',
            'title': u'Lineārā optimizācija - 1'
        }           
    ]       

    total_grades = { '40200A': '24.1', 
                    '40200B': '29.2'}    
    
    def get(self,my_id):
        #nav_items = global_navigation.nav_items()
        with open('data/global_navigation.json') as f1:
            nav_items = json.load(f1)
        with open('data-private/algorithms_grades.json') as f2:
            grades = json.load(f2)
        
        
        if (my_id == 'index.html'):
            for grade in grades['students']:
                my_total = 0
                for gg in grade['presence']:
                    if (gg == 'Y'):
                        my_total += 10/16
                    else:
                        my_total += 10/16
                #my_total += float(grade['hw1'])
                self.total_grades[grade['id']] = str(my_total)
            
            template_context = {
                'my_id': my_id,
                'course': 'algorithms',
                'nav_items': nav_items,
                'grades': grades,
                'total_grades': self.total_grades
            }
            template = jinja_env.get_template('algorithms/index.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'tales.html'):
            template_context = {
                'my_id': my_id,
                'course': 'algorithms',
                'tales': self.tales, 
                'nav_items': nav_items
            }
            template = jinja_env.get_template('algorithms/tales.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'skills.html'):     
            template_context = {
                'my_id': my_id, 
                'course': 'algorithms',
                'nav_items': nav_items                
            }
            template = jinja_env.get_template('algorithms/skills.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'problems.html'):     
            template_context = {
                'my_id': my_id, 
                'course': 'algorithms',
                'nav_items': nav_items
            }
            template = jinja_env.get_template('algorithms/problems.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'references.html'):     
            template_context = {
                'my_id': my_id,
                'course': 'algorithms',
                'nav_items': nav_items                              
            }
            template = jinja_env.get_template('algorithms/references.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        else: 
            self.response.set_status(404)


app = webapp2.WSGIApplication([    
    ('/algorithms/(.*)', AlgorithmsHandler)
], debug=True)



