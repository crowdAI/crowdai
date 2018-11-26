## Architecture

[crowdAI](https://www.crowdai.org/) is made up of several components:

* Ruby on Rails open source web app [Repo](https://github.com/salathegroup/crowdai)   

* [crowdAI Broker](./crowdai_broker.md)

* Amazon S3 Buckets

* Amazon EC2 Instances running the grading servers

* [GitLab](https://gitlab.crowdai.org)

## Architecture Components

See the **Architecture diagram**, below. The following components will make up the new crowdAI systems architecture. Some components may be easily replaced, and this will be noted.

This architecture could be replicated by other parties on private or public architectures, in line with the crowdAI open source approach. Eventually an install / developer guide will be written.

### crowdAI Webapp

The crowdAI front-end application is written in Ruby on Rails, and is hosted on Heroku (in the current repo). This component is currently being rebuilt with a new design, called "v2".

### Amazon S3 Storage

Amazon S3 is used to store files required for the application. Note that this could be replaced with a S3 compatible file store, such as [OpenStack Swift S3](https://github.com/openstack/swift3).

There is a single S3 bucket for crowdAI, which can be written to by either the **crowdAI Website** or the **crowdAI Broker**.

Types of objects stored:

- Web application media, such as participant profile images and uploaded images in challenge descriptions. This will be loaded to S3 and managed by the Ruby on Rails application, using the [Carrierwave](https://github.com/carrierwaveuploader/carrierwave) gem.
- Submission visualizations and audio files. These will be generated on a **crowdAI Grader**, prepared in thumbnail and large size by the **crowdAI Broker** and published directly to S3. An API call is made to the **crowdAI Webapp** to  link these resources with a submission, and the webapp will then display them.
- Submission models. Selected large models generated for machine learning solutions, which could be reused by others. Further discussion is required here.

[[ crowdAI Broker ]]   



### crowdAI Grading Server

https://github.com/spMohanty/GeccoOptimizationChallenge2017_job_factory

This is an optional server where a participant's code is executed. This could be to provide larger resources to the participants and thereby level the playing field, or could also be used to protect private data.

For the Stanford challenge, this was a modified OpenSim environment.

Source code for server builds will be added to Github, where appropriate.

The **crowdAI grading server** could be a fleet of servers. There will also be one instance with Redis running, where the work is accepted from the **crowdAI Broker**. This queue is then polled by the worker processes and the grading work completed.

Then the results it posted back to the Redis queue.

### crowdAI Client

To make submissions to all challenges, including completed challenges, the participant will download a Python package using **pip**. They will add their API Key and also a Challenge identifier (a string).

The client can be used to submit an answer file directly, and will then function similarly to the older submission process. Files can also be submitted, but the preferred approach will be to submit solutions directly as Python data structures. To handle traffic, **socket.io** will be used for the exchange.

The client can also be included directly into prediction code. In this case the executing code will be optionally captured and submitted to Github.

### Github

For each challenge a new Github repo is created under the **crowdAI** organization. While the challenge is running, the repo will be private. A subrepo is created for each publishing participant, and then the incremental submissions will be commits. This way the development of the solution can be easily seen via Git diffs.

Optionally the participant can fork the subrepo to their own Github account via a dialog within the **crowdAI Webapp** or directly from Github.

Participants can indicate if they wish their submitted code to the published on Github. This can be indicated at the time of submission or anytime from the Leaderboard.

All code is published under a **MIT licence**, and participants will be presented with a agreement dialog, either in the **crowdAI Client** or via a web page on the leaderboard. Details of agreements (time & date, IP) will be retained within the **crowdAI Webapp**.
