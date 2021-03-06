# -*- coding: utf-8 -*-

## DEPRECATED
##

import jinja2
import json
import os
import re
import webapp2

jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))


class ProblembaseProblemsHandler(webapp2.RequestHandler):    
    
    def get(self,my_id):  
        with open('data/competitions.json') as f1:
            the_comp = json.load(f1)
        with open('data/tasks.json') as f2:
            the_tasks = json.load(f2)
        with open('data/nfound.json') as f3:
            the_nfound = json.load(f3)
        with open('data/problems.json') as f4:
            the_problems = json.load(f4)
        with open('data/global_navigation.json') as f5:
            nav_items = json.load(f5) 

            
        ## TODO: Read this from JSON file competitions.json
        problemsets = ['EE.PK', 'EE.LO','EE.LVS', 'EE.LVT','EE.TST',
                       'LV.NO','LV.VO','LV.AO','LV.TST', 'LV.OTHER',
                       'LT.LJKMO','LT.LKMMO','LT.LDK','LT.RAJ','LT.VILNIUS','LT.LMMO','LT.VUMIF','LT.TST',
                       'BBK2012.P1','BBK2012.P2','BBK2012.P3','BBK2012.P4',
                       'BBK2012.P5','BBK2012.P6','BBK2012.P7','BBK2012.P8','BBK2012.P9']
        
        dict_totals = {}
        dict_marked = {}
        for pset in problemsets:
            dict_totals[pset] = 0
            dict_marked[pset] = 0
        
        tasks_total = len(the_tasks)
        tasks_used = 0
        markings_total = 0
        for tt in the_tasks:
            if len(tt['problems'])>0:
                tasks_used = tasks_used + 1
                markings_total = markings_total + len(tt['problems'])           
        nfound_total = len(the_nfound)

        prb_total = 0
        prb_marked = 0
        for pp in the_problems:
            prb_id = pp['id']
            pp_pref=re.sub(r'(LV|EE|LT|BBK2012)\.([^\.]+)\..*',r'\1.\2',prb_id)
            prb_total = prb_total + 1
            dict_totals[pp_pref] = dict_totals[pp_pref] + 1
            if len(pp['tasks'])>0:
                prb_marked = prb_marked + 1
                dict_marked[pp_pref] = dict_marked[pp_pref] + 1
        
        for compet in the_comp:
            compet_id = compet['id']
            compet['total'] = dict_totals[compet_id]
            compet['marked'] = dict_marked[compet_id]
        
        template_context = {                
            'lst_comp': the_comp,
            'title': u'Uzdevumu DB: Sacensību saraksts',
            'total_tasks': tasks_total,
            'used_tasks': tasks_used,
            'nfound_tasks': nfound_total,
            'markings_size': markings_total,
            'prb_total': prb_total,
            'prb_marked': prb_marked,
            'dict_totals': dict_totals,
            'dict_marked': dict_marked,
            'course': 'problembase',
            'nav_items': nav_items    
        }            
        template = jinja_env.get_template('problembase/problems.html')
        output = template.render(template_context)
        self.response.out.write(output.encode('utf-8'))

app = webapp2.WSGIApplication([    
    ('/problembase/(.*)', ProblembaseProblemsHandler)
], debug=True)



