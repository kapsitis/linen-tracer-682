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
            'title': u'Bezzudumu saspiešana - 1',
            'date': '2019-09-03'
        },
        {
            'id':'Algorithms.Lossless2', 
            'dir':'tale-algorithms-lossless-part2',
            'title': u'Bezzudumu saspiešana - 2',
            'date': '2019-09-10'

        },
        {
            'id':'Algorithms.Lossless3', 
            'dir':'tale-algorithms-lossless-part3',
            'title': u'Bezzudumu saspiešana - 3',
            'date': '2019-09-17'
        },
        {
            'id':'Algorithms.Lossy1',
            'dir':'tale-algorithms-lossy-part1',
            'title': u'Zudumradošā saspiešana - 1',
            'date': '2019-09-24'            
        },
        {
            'id':'Algorithms.Lossy2',
            'dir':'tale-algorithms-lossy-part2',
            'title': u'Zudumradošā saspiešana - 2',
            'date': '2019-10-01'            
        },
        {
            'id':'Algorithms.ErrorCorrection1',
            'dir':'tale-error-correction-part1',
            'title': u'Kļūdu labošanas algoritmi - 1',
            'date': '2019-10-08'                        
        },
        {
            'id':'Algorithms.ErrorCorrection2',
            'dir':'tale-error-correction-part2',
            'title': u'Kļūdu labošanas algoritmi - 2',
            'date': '2019-10-15'                        
        },
        {
            'id':'Algorithms.AsymmetricCryptography',
            'dir':'tale-asymmetric-cryptography-part1',
            'title': u'Kriptogrāfiskie algoritmi - 1',
            'date': '2019-10-22'                        
        },
        {
            'id':'Algorithms.AsymmetricCryptography',
            'dir':'tale-asymmetric-cryptography-part2',
            'title': u'Kriptogrāfiskie algoritmi - 2',
            'date': '2019-10-29',
            'nolink': 'True'                        
        },
        {
            'id':'Algorithms.LinearOptimization1',
            'dir':'tale-linear-optimization-part1',
            'title': u'Lineārā optimizācija - 1',
            'date': '2019-11-05'                        
        },
        {
            'id':'Algorithms.LinearOptimization2',
            'dir':'tale-linear-optimization-part2',
            'title': u'Lineārā optimizācija - 2',
            'date': '2019-11-12'             
        },           
        {
            'id':'Algorithms.LinearOptimization3',
            'dir':'tale-linear-optimization-part3',
            'title': u'Lineārā optimizācija - 3',
            'date': '2019-11-19'
            #'attachment': u'../algorithms-bin/liet2008-11-v2.doc',
            #'attachmentTitle': u'Vēst.lekcija: Lineārā programmēšana IV' 
        },
        {
            'id':'Algorithms.StringSearching1',
            'dir':'tale-string-searching-part1',
            'title': u'Virkņu meklēšana - 1',
            'date': '2019-11-26'                        
        },
        {
            'id':'Algorithms.StringSearching2',
            'dir':'tale-string-searching-part2',
            'title': u'Virkņu meklēšana - 2',
            'date': '2019-12-03'                        
        },
        {
            'id':'Algorithms.StringSearching3',
            'dir':'tale-string-searching-part3',
            'title': u'Virkņu meklēšana - 3',
            'date': '2019-12-10',
            'nolink' : 'True'
        }, 
 
    ]       

    total_grades = { '40200A': '24.1', 
                    '40200B': '29.2'}    
    
    def get(self,my_id):
        #nav_items = global_navigation.nav_items()
        with open('data/global_navigation.json') as f1:
            nav_items = json.load(f1)
        #with open('data-private/algorithms_grades.json') as f2:
        #    grades = json.load(f2)
        with open('data/algorithms_topics.json') as f3:
            jsonTopics = json.load(f3)
        with open('data/algorithms_modules.json') as f4:
            jsonModules = json.load(f4)
        
        abc = ['-','a','b','c','d','e','f','g','h','i','j',
           'k','l','m','n','o','p','q','r','s','t',
           'u','v','w','x','y','z']

        
        if (my_id == 'index.html'):
            template_context = {
                'my_id': my_id,
                'course': 'algorithms',
                'nav_items': nav_items,
                'jsonTopics': jsonTopics,
                'abc': abc
            }
            template = jinja_env.get_template('algorithms/index.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'tales.html'):
            template_context = {
                'my_id': my_id,
                'course': 'algorithms',
                #'tales': self.tales, 
                'jsonModules': jsonModules,
                'nav_items': nav_items
            }
            template = jinja_env.get_template('algorithms/tales.html')
            output = template.render(template_context)
            self.response.out.write(output.encode('utf-8'))
        elif (my_id == 'lists.html'):     
            template_context = {
                'my_id': my_id, 
                'course': 'algorithms',
                'nav_items': nav_items                
            }
            template = jinja_env.get_template('algorithms/lists.html')
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



