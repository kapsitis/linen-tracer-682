# -*- coding: utf-8 -*-

import jinja2
import json
import os
import re
import webapp2


jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))


def get_html_links(lst_problems):
    file_dict = {
        'EE.PK':'numtheory-ee-pk',
        'EE.LO':'numtheory-ee-lo',
        'EE.LVS/LVT':'numtheory-ee-lvs-lvt',
        'EE.LVS':'numtheory-ee-lvs-lvt',
        'EE.LVT':'numtheory-ee-lvs-lvt',
        'LV.NO':'numtheory-lv-no',
        'LV.VO':'numtheory-lv-vo',
        'LV.AO':'numtheory-lv-ao',
        'LT.LKMMO':'numtheory-lt-lkmmo',
        'LT.LDK':'numtheory-lt-ldk',
        'LT.RAJ':'numtheory-lt-raj',
        'LT.VILNIUS':'numtheory-lt-raj',
        'LT.LMMO':'numtheory-lt-lmmo',
        'LT.VUMIF':'numtheory-lt-vumif',
        'BBK2012.P1':'numtheory-bbk-p1',
        'BBK2012.P2':'numtheory-bbk-p2',
        'BBK2012.P3':'numtheory-bbk-p3',
        'BBK2012.P4':'numtheory-bbk-p4'
    }
    result = list()
    for pp in lst_problems:
        pp_pref=re.sub(r'(LV|EE|LT|BBK2012)\.([^\.]+)\..*',r'\1.\2',pp)
        file_id = file_dict[pp_pref]
        lower_id = pp.lower()
        result.append('<a href="../../files-prob/%s/content.html#/%s">%s</a>' % (file_id,lower_id,pp))
    return result


class ProbGetConceptHandler(webapp2.RequestHandler):    
    
    def get(self,my_id):
        #item = my_id.split("/")    
        with open('data/summary_concepts.json') as f1:
            summary_concepts = json.load(f1)
        problems = list()
        for concept in summary_concepts:
            if concept['c_id'] == my_id:
                problems = concept['pp']
                break
        template_context = {
            'title': my_id,            
            'problems': get_html_links(problems)
        }            
        template = jinja_env.get_template('prob/get_concept.html')
        output = template.render(template_context)
        self.response.out.write(output.encode('utf-8'))

app = webapp2.WSGIApplication([    
    (r'/concept/(.*)', ProbGetConceptHandler)
], debug=True)



