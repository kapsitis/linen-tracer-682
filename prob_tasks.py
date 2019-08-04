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



class ProbTasksHandler(webapp2.RequestHandler):
    
    def get(self,my_id):                
        with open('data/tasks.json') as f:
            lst_tasks = json.load(f)
        with open('data/nfound.json') as f2:
            lst_nfound = json.load(f2)
        
        for task in lst_tasks:
            task['esc_desc'] = escape_math_seq(task['desc'])
        
        for task in lst_tasks:
            links = get_html_links(task['problems'])
            task['html_links'] = ', '.join(links)
            level_str = '.'.join(task['levels'])
            # compute whitespace
            whitespace = ''
            for j in range(len(level_str),8):
                whitespace = whitespace + '&nbsp;'            
            task['whitespace'] = whitespace
        
        for task in lst_nfound:
            links = get_html_links(task['links'])
            task['html_links'] = ', '.join(links)
                
        template_context = {                
            'lst_tasks': lst_tasks,
            'title': u'Skaitļu teorija: Prasmes',
            'nfound_lst': lst_nfound
        }            
        template = jinja_env.get_template('prob/tasks.html')
        output = template.render(template_context)
        self.response.out.write(output.encode('utf-8'))
            


app = webapp2.WSGIApplication([    
    ('/prob/(.*)', ProbTasksHandler)
], debug=True)



