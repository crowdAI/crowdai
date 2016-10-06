
## Submission Grading

There are two options for grading submissions

#### F1 Logloss

crowdAI has an grader based in F1 score using the logloss as a seconday sort. This is executed on the crowdAI Python grading server.

It requires an answer file and a grading factor to be provided in the challenge configuration. If the grading factor is changed at any time, all previously graded submissions will be re-graded.

#### Docker Container

This option is used when the submission code must be executed in order to grade the submission. When the participant makes their submission, they chose which Docker container it is built with. Standard containers for various Deep Learning frameworks or a regular SciPy stack can be provided.

In the Challenge-Docker configuration, a project directory is indicated, and a list of files that will be executed when the container is built. Usually the **callback.sh** script is run last to return any result to the Rails server.

Optionally, a some of these files may be overwitten by the participant submission (eg: run.sh).

##### Step 1 - Define container

- Choose a container from Docker Hub
- Give it a name, which will then appear in submission dropdowns
- Indicate the project directory name
- Indicate if dataset files will be automatically injected into the container and if they will be unzipped


##### Step 2 - Define File Submission requirements

- Define filename and type
- Indicate if zip and tar files will be automatically unzipped when injected into the container

##### Step 3 - Launch container

- Container is launched on the EC2 Docker Machine by button on the submission page (later automatically)
- Files are automatically injected as per the defintion
- Execute command as indicated on the container is run (usually **run.sh**)
- Results are sent back to the Rails server and leaderboard via a callback API script **callback.sh**
