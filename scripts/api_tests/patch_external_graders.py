"""
PATCH /api/external_graders/:submission_id
Update the media or regrade a previous submission
USAGE:
$ python patch_external_graders.py [auth_api_key] [participant_api_key] [challenge_client_name]
"""

import sys
import requests
from requests.auth import HTTPBasicAuth

#URL='http://localhost:3000/api/external_graders/'
URL='https://crowdai-stg.herokuapp.com/api/external_graders/'


def call_post(headers,participant_api_key,challenge_client_name):
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
    if r.status_code == 202:
        print '202: ' + r.text
        submission_id = r.json()["submission_id"]
        print 'submission_id' + str(submission_id)
        patch_media(headers,submission_id)
        patch_regrade(headers,submission_id)


def patch_media(headers,submission_id):
    url = URL + str(submission_id)
    print 'Calling: PATCH {}'.format(url)
    params = {
        'media_large': '/s3 url',
        'media_thumbnail': '/s3_thumbail',
        'media_content_type': 'application/png'
    }
    print params
    r = requests.patch(url, headers=headers, params=params)
    print 'Status: ' + str(r.status_code)
    print r.text


def patch_regrade(headers,submission_id):
    url = URL + str(submission_id)
    print 'Calling: PATCH {}'.format(url)
    params = {
        'grading_status': 'graded',
        'score': 0.9999
    }
    r = requests.patch(url, headers=headers, params=params)
    print 'Status: ' + str(r.status_code)
    print r.text


def main():
    print 'main()'
    auth_api_key = str(sys.argv[1])
    participant_api_key = str(sys.argv[2])
    challenge_client_name = str(sys.argv[3])
    headers = {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization': 'Token token={}'.format(auth_api_key)
    }
    submission_id = call_post(headers,participant_api_key,challenge_client_name)
    if submission_id:
        print 'patching'
        patch_media(headers,submission_id)

main()
