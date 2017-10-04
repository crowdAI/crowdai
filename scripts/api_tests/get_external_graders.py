"""
GET /api/external_graders
Verify the Participant's API key
USAGE:
$ python get_external_graders.py [auth_api_key] [participant_api_key]
"""

import sys
import requests

BASE_URL='https://crowdai-stg.herokuapp.com/api/external_graders/'
#BASE_URL='http://localhost:3000/api/external_graders/'
auth_api_key = str(sys.argv[1])
participant_api_key = str(sys.argv[2])

headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization': 'Token token={}'.format(auth_api_key)
}
url = BASE_URL + participant_api_key

print 'GET {}'.format(url)
print 'headers: {}'.format(headers)

r = requests.get(url, headers=headers)
print 'Status: ' + str(r.status_code)
print r.text
