# Gitlab based grading

Steps :

* User creates a repository on [https://gitlab.crowdai.org](https://gitlab.crowdai.org)
* The repository should be [Binder](http://mybinder.readthedocs.io/en/latest/) compatible
* The name of the repository should match the crowdAI `challenge_id`
* The repository should have `crowdai.json` file with the following structure
```javascript
{
   "challenge_id":"<crowdai_challenge_id>",
   "authors":[
      "user_id_1",
      "user_id_2"
   ],
   "description":"optional description"
}
```

**Note** : The `authors` field is optional. In the absence of the `authors` field, it will be populated with the `user_id` of the user from [https://gitlab.crowdai.org](https://gitlab.crowdai.org).   
**Note** : In the case that some of the user_ids are invalid, then they will be ignored.   
**Note** : The user can include any other arbitrary keys to the JSON file for their own book keeping

* User(s) make a submission by pushing a tag.
* A [Gitlab System Hook](https://gitlab.crowdai.org/help/system_hooks/system_hooks) makes a POST request with relevant parameters to an API service.
* The API Service announces the "submission" to [crowdai.org][crowdai.org] rails app.
* If the User has already exceeded his quota for the time-window, then the job is marked as `failed`, and **WILL NOT** be processed automatically again.
* The API Service pushes then job into a challenge-specific(namespaced) job_queue
* One worker pick up the job
* The worker uses [repo2docker](http://github.com/crowdAI/repo2docker/) to convert the repository into a docker image
* The worker orchestrates the docker image based on the challenge specific orchestration rules
* The orchestrator has necessary Access Keys to enable it to update progress/failure/success of the orchestration to the [crowdai.org][crowdai.org] rails app.


## Design Decisions
- While we strongly considered using Gitlab CI for the initial orchestration, we moved away from it, as it is way too verbose for us to use in a meaningful sense, especially in a challenge context. Where potentially participants could exploit the verbose outputs to figure out challenge specific secrets.
- Plus, Gitlab CI provides us with wayy too much features which are very redundant for our use case.


## Other Considerations

- Reproducibility is our prime motivating force. We want **all** submissions to be reproducible. While `repo2docker` based approaches are a good step in that direction, it still has no control over packages breaking, dependencies vanishing, etc, especially when trying to reproduce a submission after a long period of time. Hence, what we will do is, for every submission, when we build an image, we store it in a private docker registry for future access. Because of resource contraints we will not provide public access to the same, but over time, resource permitting we can make it available. This step guarantees exact reproducibility for every single.
**Note** : If we go ahead with this decision, then the storage prices for S3 can rack up pretty fast if we are not careful about it. Another possibility is to look at public docker registries like `DockerHub` to host all the images. The ownership and licensing aspects because tricky in that case.
