import requests

class RailsAPI(object):
  def __init__(self,submission_id):
    token="***REMOVED***"
    base_url = 'https://www.crowdai.org/api/v1/submissions/'
    self.headers = { 'Authorization': 'Token token=' + token, "Content-Type": "application/json" }
    self.url = base_url + submission_id
    print self.url
    
  def call_endpoint(self,payload):
    response = requests.put(self.url, params=payload, headers=self.headers, verify=False)
    print response 
       
    # curl -X PUT -G http://localhost:3000/api/v1/submissions/24 -d "score=999999" -d "score_secondary=123456" -H 'Authorization: Token token="***REMOVED***"'
    
    
    
  