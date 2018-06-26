### crowdAI Broker

**TODO: Out of date** 

[Component Repo](https://github.com/spMohanty/crowdai-grading-server). Note that this will be renamed to be the **crowdAI Broker**.

This is a queuing and coordination system between the other nodes. It runs on a single server running on EC2 and be written in Python and using [socket.io](https://socket.io/) for client communication. Redis will be used to manage internal queues.

The broker will coordinate all work for crowdAI, and perform the following functions:

- Retrieve Challenge configuration from the Rails Webapp
- Accept Authentication from client
- Accept submissions from clients
- Validate the participant API key and Challenge Identifier
- Provide a session token to the client
- Send submissions to the **crowdAI Grader**
- Post grades to the **crowdAI Webapp** on the leaderboard
- Accept submitted code and post to Github to a private repo, with a user's permission at the per submission level. At the end of the challenge the repo will be made public.
- Communicate submission results back to the client
- Provide grading progress visual to the client

#### Challenge Configuration

[config_loader](https://github.com/spMohanty/crowdai-grading-server/blob/master/utils.py#L21)

This will be replaced by the **Read Challenge Configuration** endpoint.

#### Accept Authentication from Clients  

[handle_authenticate](https://github.com/spMohanty/crowdai-grading-server/blob/master/run.py#L23)

#### Accept Submissions from Clients

[execute_function](https://github.com/spMohanty/crowdai-grading-server/blob/master/run.py#L101)

#### Validate the API Key and Challenge Identifier

The client API key and Challenge Identifier are validated via and API call to the Rails Webapp.

#### Provide a session token to the client

[handle_authenticate](https://github.com/spMohanty/crowdai-grading-server/blob/master/run.py#L23)

#### Send submissions to the Grader  



### Component Communication

The communication between the **crowdAI Broker**, the client the **crowdAI Grading Server** is handled using **socket.io**, and is documented in the respective repos.

The **Broker** communicates with the **Webapp** using API calls. [[ Webapp and Broker Communication ]]    
