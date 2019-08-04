# -*- coding: utf-8 -*-

import jinja2
import json
import os
import re
import webapp2

jinja_env = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))


def get_gradegroup_by_id(prob_id):
    if re.match('^(LV|EE|LT)\.[^\.]+\.[0-9]+\.[7-9].*',prob_id):
        return '9'
    else:
        return '12'

def get_cat1(tsk): 
    items = tsk.split('.')
    return items[0]

def get_cat2(tsk): 
    items = tsk.split('.')
    return '%s.%s' % (items[0], items[1])


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
        'EE.LVS':'numtheory-ee-lvs',
        'EE.LVT':'numtheory-ee-lvt',
        'EE.TST':'numtheory-ee-tst',
        'LV.NO':'numtheory-lv-no',
        'LV.VO':'numtheory-lv-vo',
        'LV.AO':'numtheory-lv-ao',
        'LV.TST':'numtheory-lv-tst',
        'LV.OTHER':'numtheory-lv-other',
        'LT.LKMMO':'numtheory-lt-lkmmo',
        'LT.LDK':'numtheory-lt-ldk',
        'LT.RAJ':'numtheory-lt-raj',
        'LT.VILNIUS':'numtheory-lt-vilnius',
        'LT.LMMO':'numtheory-lt-lmmo',
        'LT.VUMIF':'numtheory-lt-vumif',
        'LT.TST':'numtheory-lt-tst',
        'BBK2012.P1':'numtheory-bbk-p1',
        'BBK2012.P2':'numtheory-bbk-p2',
        'BBK2012.P3':'numtheory-bbk-p3',
        'BBK2012.P4':'numtheory-bbk-p4',
        'BBK2012.P5':'numtheory-bbk-p5',
        'BBK2012.P6':'numtheory-bbk-p6',
        'BBK2012.P7':'numtheory-bbk-p7',
        'BBK2012.P8':'numtheory-bbk-p8',
        'BBK2012.P9':'numtheory-bbk-p9'
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
        with open('data/problems.json') as f1:
            the_problems = json.load(f1)
       
        sections = ['alg','div','mod','nota','seq','misc','comb']
        skill_groups = {
            'alg': ['alg.expr', 'alg.tra', 'alg.series', 'alg.ineq', 'alg.linear', 'alg.poly'],
            'div': ['div.prop', 'div.fta', 'div.common', 'div.valu'],
            'mod': ['mod.fix', 'mod.congr', 'mod.period', 'mod.exp', 'mod.eq'],
            'nota': ['nota.est', 'nota.divrule','nota.combine','nota.algor'],
            'seq': ['seq.spec', 'seq.arithm', 'seq.geom', 'seq.recur','seq.gaps'],
            'comb': ['comb.full', 'comb.count', 'comb.graph', 'comb.constr'],
            'misc': ['misc.try', 'misc.extr', 'misc.invar', 'misc.ind', 'misc.symm']
        }
        
        topic_titles = {
            'alg': 'Algebraic skills',
            'alg.expr': 'Build variable expressions',
            'alg.tra': 'Use algebraic transformations', 
            'alg.series': 'Handle long sums and products',
            'alg.ineq': 'Prove and use inequalities',
            'alg.linear': 'Manipulate linear equations and systems',
            'alg.poly': 'Use the properties of integer polynomials', 
            
            'div': 'Divisibility skills',
            'div.prop': 'Use divisibility relation and its properties',
            'div.fta': 'Use Fundamental theorem of arithmetic (prime factorization)',
            'div.common': 'Use the properties of gcd and lcm',
            'div.valu': 'Compute and use p-valuations',
            
            'mod': 'Modular arithmetic skills',
            'mod.fix': 'Use fixed modules: parity, last digits', 
            'mod.congr': 'Map integers to congruence classes and do arithmetic', 
            'mod.period': 'Use the periodicity of remainder sequences', 
            'mod.exp': 'Investigate congruences of an exponential function', 
            'mod.eq': 'Solve congruence equations and linear systems',

            'nota': 'Numeral notation skills',
            'nota.est': 'Estimate digits and the digit count in numbers', 
            'nota.divrule': 'Apply divisibility rules',
            'nota.combine': 'Express digit manipulations with expressions',
            'nota.algor': 'Use notation-based algorithms',
            
            'seq': 'Integer sequence skills',
            'seq.spec': 'Recognize numbers with special properties', 
            'seq.arithm': 'Use the properties of arithmetic progressions', 
            'seq.geom': 'Use the properties of geometric progressions',
            'seq.recur': 'Study other recurrent sequences',
            'seq.gaps': 'Estimate sequence growth and their gaps',
         
            'comb': 'Combinatorics skills',
            'comb.full': 'Perform full case analysis', 
            'comb.count': 'Count the number of variants', 
            'comb.graph': 'Use graphs to build examples', 
            'comb.constr': 'Use other structures to build examples',
            
            'misc': 'Miscellaneous skills',
            'misc.try': 'Experiment with some parameters and generalize', 
            'misc.extr': 'Select the extreme elements', 
            'misc.invar': 'Create and use invariants', 
            'misc.ind': 'Prove statements with mathematical induction', 
            'misc.symm': 'Use symmetry inherent in the problem'   
        }

        grp_lst = topic_titles.keys()
        grp_jun = {}
        grp_sen = {}
        for grp in grp_lst:
            grp_jun[grp] = 0
            grp_sen[grp] = 0
        
        for problem in the_problems:
            grade_group = get_gradegroup_by_id(problem['id'])            
            
            for tsk in problem['tasks']:
                cat1 = get_cat1(tsk)
                cat2 = get_cat2(tsk)
                if cat2 in grp_lst:
                    if grade_group == '9':
                        grp_jun[cat1] += 1
                        grp_jun[cat2] += 1
                    else:
                        grp_sen[cat1] += 1
                        grp_sen[cat2] += 1
        

        template_context = {
            'title': u'Task groups: Statistics',
            'sections': sections,
            'skill_groups': skill_groups,
            'topic_titles': topic_titles,
            'grp_jun': grp_jun,
            'grp_sen': grp_sen
        }            
        template = jinja_env.get_template('prob/task_groups.html')
        output = template.render(template_context)
        self.response.out.write(output.encode('utf-8'))
            


app = webapp2.WSGIApplication([    
    ('/prob/(.*)', ProbTaskGroupsHandler)
], debug=True)



