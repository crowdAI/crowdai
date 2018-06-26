# Grading Overview

## Strategy

crowdAI uses a flexible, distributed grading architecture. For each challenge, crowdAI participants download a Python client, develop their answer using this client and then submit it.

A submission client will be published on [PyPI](https://pypi.python.org/pypi) as a Python **pip** package. It will be possible to include this directly into the challenge code, or it could also be a standalone step in a submission pipeline. Future versions will target other languages and frameworks.

As part of the crowdAI open source philosophy, all of the grader code will be eventually open sourced and housed in this crowdAI Github organisation.

## Goals

- Produce a unified grading architecture
- Be able to easily scale for specific challenges and point in time demand
- Reduce the per-challenge development effort, though it is expected there will always be some work required
- Optionally produce submission media for display on the leaderboard. This will include video, static images and audio.
- Allow the submission of code which would be executed on private servers, which would be required when challenge data cannot be released due to privacy reasons.
- Cater for a pluggable grading architecture, so that different resources could be applied at any time without a significant engineering effort.
- Capture submission code and publish on Github after the challenge has ended
- Reduce load on the Heroku web app by pre-processing media objects on the **crowdAI Broker**, and posting directly to S3.
- Monitoring of the infrastructure will be possible from a single dashboard within the **crowdAI Webapp**.
- Infrastructure configuration of a challenge will be specified from a single control panel within the **crowdAI Webapp**.
- Execution environment for the upcoming **crowdAI Dojo**.

## Challenge Types

At a high level there are two types of challenge:

- User submits a file which is compared against a known answer file on the Scipy Server (PlantVillage, Dark Skies, Ant Challenge)
- User executes their code in a client on their own machine to a grading server, which then posts the results of the attempt as well as media objects (video only to date) to crowdAI (Learning how to walk, BBP). The results are then displayed on the leaderboard.


## Post Challenge

After a challenge has closed, crowdAI continues to accepts submissions for most challenges, so effectively all challenges are continuously running. The ability to accept challenges is controlled by the challenge configuration.

Participant code will also be captured and stored in a GitHub Repo, which will be made public at the end of the challenge.
