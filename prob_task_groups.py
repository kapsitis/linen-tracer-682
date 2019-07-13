# -*- coding: utf-8 -*-

import jinja2
import json
import os
import re
import webapp2

jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))

def escape_math(res):
    PRE = '<span class="math inline">\('
    POST = '\)</span>'

    res = re.sub('<', '&lt;', res)
    res = re.sub('>', '&gt;', res)
    is_math = False
    
    if re.match('[^ ]+\^[^ ]+', res):
        is_math = True
    if re.match('[^ ]+(&lt;|&gt;)[^ ]+', res):
        is_math = True
    if re.match('[^ ]+_[^ ]+', res):
        is_math = True
    
    if is_math:
        res = '%s%s%s' % (PRE, res, POST)
    return res 


def escape_math_seq(arg):
    words = arg.split()
    result = list()
    for word in words: 
        result.append(escape_math(word))
    return ' '.join(result)


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



class ProbTaskGroupsHandler(webapp2.RequestHandler):



    def get(self,my_id):
        sections = ['alg','div','mod','notation','seq','misc','comb']
        skill_groups = {
            'alg': ['alg.expr', 'alg.tra', 'alg.series', 'alg.ineq', 'alg.linear', 'alg.poly'],
            'div': ['div.prop', 'div.fta', 'div.common', 'div.valu'],
            'mod': ['mod.fix', 'mod.congr', 'mod.period', 'mod.exp', 'mod.eq'],
            'nota': ['nota.est', 'nota.divrule','nota.combine','nota.algor','nota.nondec'],
            'seq': ['seq.feat', 'seq.arithm', 'seq.geom' 'seq.recur','seq.gaps','seq.funeq'],
            'comb': ['comb.full', 'comb.count', 'comb.graph', 'comb.constr'],
            'misc': ['misc.try', 'misc.extr', 'misc.invar', 'misc.ind', 'misc.symm']
        }

        template_context = {                
            'title': u'Task groups: Statistics',
            'sections': sections,
            'skill_groups': skill_groups
        }            
        template = jinja_env.get_template('prob/task_groups.html')
        output = template.render(template_context)
        self.response.out.write(output.encode('utf-8'))
            


app = webapp2.WSGIApplication([    
    ('/prob/(.*)', ProbTaskGroupsHandler)
], debug=True)



