## Overview

The crowdAI Grader communicates with the crowdAI Front-end using a single endpoint **https://www.crowdai.org/api/external_graders**, with three actions possible: GET, POST and PATCH.

## Authentication

There are four possible API keys for use with crowdAI:

- Admin API Key
- Organizer API Key
- Developer API Key
- Team API Key

## Endpoints

### GET: Verify Developer API Key

endpoint: /api/external_graders/:id
verb: GET
auth: organizer API key OR crowdAI API key
id: dev_api_key
returns:
- status 200
- participant_id + 200


### GET: Verify Team API Key - not yet implemented

endpoint: /api/external_graders/:id
verb: GET
auth: organizer API key OR crowdAI API key
id: team_api_key
returns:
- status 202
- team leader participant_id + 200

### POST: Graded Submission

endpoint: /api/external_graders
verb: POST
auth: organizer API key
params:
- dev_api_key (required)
- challenge_client_id (required)
- score (required - can be zero)
- score_secondary (optional)
- comment (markdown - optional - made by participant)
- grading_status ('graded' | 'failed')
- grading_message (required for grading_status = failed)

returns:
- submission_id
- message: "Participant #{participant.name} scored"
- submissions_remaining (today)
- submission_reset_dttm (UTC - when the submission count starts again)

- Admins are sent an email


### PATCH: Rescore Submission

endpoint: /api/external_graders
verb: PATCH
auth: organizer API key
- submission_id (required)
- score (required - can be zero)
- score_secondary (optional)
- grading_status ('graded' | 'failed')
- grading_message (required for grading_status = failed)

**Notes**

- When a submission is regraded it's **post challenge** status remains the same. The actual submission datetime is recorded.

- Admins are not sent an email

### PATCH: Add Media

endpoint: /api/external_graders
verb: PATCH
auth: organizer API key
- submission_id (required)
- media_large (optional)
- media_thumbnail (optional)
- media_content_type (optional)
- grading_status ('graded' | 'failed')
- grading_message (required for grading_status = failed)

**Notes**

- Admins are not sent an email

- Media fields must be all populated or none populated.

- The fields in the two PATCH calls can be combined into a single PATCH call.


### Error messages

The HTTP status is always returned. There will also be a message if there is an error:

- "HTTP Token: Access denied."
- "The API key did not match any participant record."
- "The Challenge Client Name string did not match any challenge."
- "Grading status must be one of (graded|failed)"
- "Submission ID is invalid."
- "The participant has no submission slots remaining for today."
- "Grading message must be provided if grading = failed"
