## Overview

crowdAI can use a custom OpenSim environment for grading. The Challenge is marked as **external** in the challenge configuration.

## API Keys

Required with every submission:

- Host API Key (passed in the request header)
- Participant API Key (passed in the body)
- Challenge Client Name (a string uniquely identifying the challenge. Defined on the challenges page

There are two API keys required with every submission.

#### Organizer API Key

The Organizer may find their API key on their organizer page, and may request the key be recycled. If the key si recycled the old key is immediately invalidated.

The Organizer API key is passed over https with API call in the header.

```bash
-H 'Authorization: Token token="[ORGANIZER_API_KEY]"'
```

#### Developer API Key

The developers may find their API keys on their profile page, and may also recycle them at any time. As with the organizer, the old keys are immediately invalidated when recycled. The Developer API keys are passed as request parameters.



## Example API Calls


### Verify Developer API key is valid

**GET /api/external_graders/:dev_api_key**

```bash
curl -i -g -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X GET "https://crowdai-stg.herokuapp.com/api/external_graders/[DEV_API_KEY]" -H 'Authorization: Token token="[ORGANIZER_API_KEY]"'
```

### Submit the grade

An integer submission ID is returned. This can be used to later PATCH the same submission, eg: to add media.

Required Fields

If submission graded successfully:

- challenge_client_name
- grading_status (graded)
- score
- score_secondary (optional)
- comment (optional)
- media_large (optional)
- media_thumbnail (optional)
- media_content_type (optional)


If grading failed:

- challenge_client_name
- grading_status  (failed)
- grading_message (grading error message)



**POST /api/external_graders**


```bash
curl -i -g -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST "https://crowdai-stg.herokuapp.com/api/external_graders/[DEV_API_KEY]?challenge_client_name=bluebrainchallenge&grading_status=graded&score=0.99&media_large=[S3 Resource]&media_thumbnail=[S3 Resource]&media_content_type=image%2Fpng" -H 'Authorization: Token token="[ORGANIZER_API_KEY]"'
```

### Update existing submission

Any of the original submission fields can be updated, using a PATCH. The same body params as the POST.

**PATCH /api/external_graders**

/api/external_graders/:id


## Overview

crowdAI can use a custom OpenSim environment for grading. The Challenge is marked as OpenSim grading in the challenge configuration, and the grader is configured according to [[ OpenSim Grading Configuration ]].

## API Keys

There are two API keys required with every submission.

#### Organizer API Key

The Organizer may find their API key on their organizer page, and may request the key be recycled. If the key si recycled the old key is immediately invalidated.

The Organizer API key is passed over https with API call in the header.

```bash
-H 'Authorization: Token token="[ORGANIZER_API_KEY]"'
```

#### Developer API Key

The developers may find their API keys on their profile page, and may also recycle them at any time. As with the organizer, the old keys are immediately invalidated when recycled. The Developer API keys are passed as request parameters.


## API Endpoints

Base url for all calls is ```https://crowdai.org/api```

| Endpoint  | Verb  | Url Params  | Return  | Purpose  |
|---|---|---|---|---|
| /api_opensim_grading/:dev_api_key  | GET  | :challenge_id           | | Verify Developer API key is valid  |  
| /api/opensim_gradings              | POST  | :dev_api_key <br/> :challenge_id <br/> :grading_status <br/> :score  | :submission_id | Submit the grade |
| /api/opensim_gradings/:dev_api_key  | PATCH | :submission_id  <br/> :s3_key       |  | Upload GIF to submission  |


## Example API Calls


### Verify Developer API key is valid

**GET /api_opensim_grading/:dev_api_key**

```bash
curl -i -g -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X GET "https://www.crowdai.org/api/opensim_gradings/[DEV_API_KEY]" -H 'Authorization: Token token="[ORGANIZER_API_KEY]"'
```

### Submit the grade

**POST /api/opensim_gradings**


```bash
curl -i -g -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST "https://www.crowdai.org/api_opensim_gradings/[DEV_API_KEY]?challenge_id=4&grading_status=graded&score=0.99" -H 'Authorization: Token token="[ORGANIZER_API_KEY]"'
```

### Upload GIF to submission

**PATCH /api/opensim_gradings/:dev_api_key**

```bash
curl -i -g -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X PATCH "https://www.crowdai.org/api_opensim_gradings/[DEV_API_KEY]?submission_id=1234&s3_key=[S3_KEY]" -H 'Authorization: Token token="[ORGANIZER_API_KEY]"'
```

**Example Call**

```bash
HTTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/"26fc5d3b6df34dc90bc2a921b6ca840f"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 75b9ab67-e21b-425b-b19a-9190eef23449
X-Runtime: 2.162171
Transfer-Encoding: chunked

{"message":"Animated GIF accepted for processing."}
```

**If the key cannot be found**

```bash
HTTP/1.1 400 Bad Request
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: 14343ec9-9483-4618-9c06-b65cf594da9a
X-Runtime: 0.324404
Transfer-Encoding: chunked

{"message":"The specified key does not exist."}
```

## Overview

The **crowdAI Broker** is the only component which communicates directly with the **crowdAI Webapp**. There are three API endpoints:

- Read Challenge Configuration
- Authenticate Participant
- Submit entry

## Authentication

An API key has been assigned to the Broker, and it is stored as an environment variable in the application.yml file of the **crowdAI Webapp** as **CROWDAI_API_KEY**. This key is passed with every API call in the header as authorization.


## API Keys

Required with every submission:

- Host API Key (passed in the request header)
- Participant API Key (passed in the body)
- Challenge Client Name (a string uniquely identifying the challenge. Defined on the challenges page

There are two API keys required with every submission.

#### Organizer API Key

The Organizer may find their API key on their organizer page, and may request the key be recycled. If the key si recycled the old key is immediately invalidated.

The Organizer API key is passed over https with API call in the header.

```bash
-H 'Authorization: Token token="[ORGANIZER_API_KEY]"'
```

#### Developer API Key

The developers may find their API keys on their profile page, and may also recycle them at any time. As with the organizer, the old keys are immediately invalidated when recycled. The Developer API keys are passed as request parameters.



## Example API Calls


### Verify Developer API key is valid

**GET /api/external_graders/:dev_api_key**

```bash
curl -i -g -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X GET "https://crowdai-stg.herokuapp.com/api/external_graders/[DEV_API_KEY]" -H 'Authorization: Token token="[ORGANIZER_API_KEY]"'
```

### Submit the grade

An integer submission ID is returned. This can be used to later PATCH the same submission, eg: to add media.

Required Fields

If submission graded successfully:

- challenge_client_name
- grading_status (graded)
- score
- score_secondary (optional)
- comment (optional)
- media_large (optional)
- media_thumbnail (optional)
- media_content_type (optional)


If grading failed:

- challenge_client_name
- grading_status  (failed)
- grading_message (grading error message)



**POST /api/external_graders**


```bash
curl -i -g -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST "https://crowdai-stg.herokuapp.com/api/external_graders/[DEV_API_KEY]?challenge_client_name=bluebrainchallenge&grading_status=graded&score=0.99&media_large=[S3 Resource]&media_thumbnail=[S3 Resource]&media_content_type=image%2Fpng" -H 'Authorization: Token token="[ORGANIZER_API_KEY]"'
```

### Update existing submission

Any of the original submission fields can be updated, using a PATCH. The same body params as the POST.

**PATCH /api/external_graders**

### API Responses

```
Api::ExternalGradersController
  GET /api/external_graders/:api_key : validate user API key
    with valid key
      should respond with numeric status code 200
      should eq "{\"message\":\"Developer API key is valid\"}"
    with invalid key
      should respond with numeric status code 404
      should eq "{\"message\":\"No participant could be found for this API key\"}"
    with missing key
      should respond with numeric status code 404
  POST /api/external_graders/ : create submission
    with valid attributes
      should respond with numeric status code 202
      should eq "Participant Example_name_10 scored"
      should be a kind of Integer
    with invalid developer API key
      should respond with numeric status code 400
      should eq "The API key did not match any participant record."
      should be nil
    with invalid host API key
      should respond with numeric status code 401
    with invalid Challenge Client Name
      should respond with numeric status code 400
      should eq "The Challenge Client Name string did not match any challenge."
      should be nil
    with invalid grading status
      should respond with numeric status code 400
      should eq "The Challenge Client Name string did not match any challenge."
      should be nil
    participant has made their daily limit of submissions
      should respond with numeric status code 400
      should eq "The participant has no submission slots remaining for today."
      should be nil
  GET /api/external_graders/challenge_config : retrieve challenge configuration
    with valid challenge_client_name
      should respond with numeric status code 200
      should eq "Configuration for test"
      should eq "test"
    with valid challenge_client_name
      should respond with numeric status code 400
      should eq "The Challenge Client Name string did not match any challenge."
      should be nil
```
