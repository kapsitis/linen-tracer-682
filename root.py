import webapp2

class RootHandler(webapp2.RequestHandler):
    def get(self):
        self.redirect('main/index.html')

app = webapp2.WSGIApplication([    
    ('/', RootHandler)
], debug=True)

