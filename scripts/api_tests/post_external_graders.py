"""
GET /api/external_graders
Verify the Participant's API key
USAGE:
$ python post_external_graders.py [auth_api_key] [participant_api_key] [challenge_client_name]
"""

import sys
import requests

URL='https://crowdai-stg.herokuapp.com/api/external_graders/'
#URL='http://localhost:3000/api/external_graders/'

auth_api_key = str(sys.argv[1])
participant_api_key = str(sys.argv[2])
challenge_client_name = str(sys.argv[3])

headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization': 'Token token={}'.format(auth_api_key)
}

params = {
    'challenge_client_name': challenge_client_name,
    'api_key': participant_api_key,
    'grading_status': 'graded',
    'score': 0.9763
}

print 'Calling: POST {}'.format(URL)

r = requests.post(URL, headers=headers, params=params)
print 'Status: ' + str(r.status_code)
print r.text
