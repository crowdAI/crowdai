### Step 1 : Organisation Participants

Define the Organization and Organization participants.

Within the **crowdAI Webapp** the Organization and it's users are configured via a web page. These users are able to create and edit challenges, but cannot move the challenge into "starting soon" or "running" status. They may define all aspects of the grading architecture.

### Step 2 : Challenge Configuration  

The challenge description pages are completed in the crowdAI Webapp by the organizer.

Within the **crowdAI Webapp** the following parameters required for grading are set:

- Challenge Identifier (slug)
- Python Class / Repo for challenge
- Grading Server (Redis) Host
- Answer file S3 URL
- Grading Factor
- Threshold
- Primary Score Fieldname
- Optional Secondary Score Fieldname

[[ Example JSON Response ]]   

### Step 3 : Build the Grader

Example code is forked into a (public?) repo, and modified for the specific challenge. This code will be used to build the grading server. The challenge API Key is stored in a secrets.py file on this server.

The IP / hostname of the grading server has been configured in step 2, and the **Broker** will only consider this configuration.

### Step 4 : Update the Broker

(Mohanty to complete)

### Step 5 : Update the Client

The Python client library is modified for each challenge. The **BaseChallenge** class is subclassed into a project specific class. If the standard **evaluate** and **submit** functions only are required, no changes may be required here but we still need to subclass.

The name of the subclass is stored in the Rails app (step 2).

### Step 6 : Launch the Challenge

The challenge is switched to 'running' and promoted.
