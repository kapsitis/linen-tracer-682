import webapp2

class RootHandler(webapp2.RequestHandler):
    def get(self):
        self.redirect('/default/index.html')

class RootHandler2(webapp2.RequestHandler):
    def get(self):
        self.redirect('/default/index.html')

app = webapp2.WSGIApplication([    
    ('/', RootHandler), ('/tale/.*', RootHandler2)
], debug=True)

