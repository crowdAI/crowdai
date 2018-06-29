# Application Documentation

This is the process documentation for crowdAI. It is a work in progress, and portions may be incomplete or out of date.

If you see something that needs some improved documentation, please go ahead and make a [pull request](https://github.com/crowdAI/crowdai/pulls).

## Participant Accounts

crowdAI is a public website and large sections of the application are publicly viewable. To contribute to crowdAI or engage in a challege, users can sign up for a free participant account.

crowdAI has support for [GDPR](./gdpr.md), [fine-grained email preferences](./email_preferences.md).

## Challenge Organizers

Organizers are groups such as universities or companies which launch competitions using crowdAI, define the competition rules and provide data and other information to competitors.

The organizers also judge the competitors and, at the end of the competition, award the winner.

### Organizer Creation and User Association

An Organizer has one or more user accounts associated with it, these accounts are equivalent in authority and can perform the same actions.

The Organizer account is created in the admin panel. Participant accounts are associated with it via the Participant record in the admin panel.

Once created with associated accounts, the Organizer Participants can create new challenges via the organizer page. Currently Organizers are accessed via links on the challenges themselves (insert screen shot), but they can also be accessed via direct url links.

[Permissions and Roles](./permissions_and_roles.md)

Related open issues:

- [Organizer security](https://github.com/crowdAI/crowdai/issues/862)
- [Organizer Admin access](https://github.com/crowdAI/crowdai/issues/869)


## Challenges

Challenges run on crowdAI to crowd-source machine learning solutions to open data problems.

- [New Challenge Creation](./new_challenge_creation.md)
- [Ordering of Challenges](./ordering_of_challenges.md)
- [Challenge Registrations](./challenge_registrations.md)
- [CLEF Challenges](./clef_challenges.md)
- [Dynamic challenge content](./dynamic_content.md)
- [Leaderboard and Submissions visibility](./leaderboard_submissions_visibility.md)
- [Post Challenge Submissions](./post_challenge_submissions.md)
- [Private Challenges](./private_challenges.md)
- [Submission Limits](./submission_limits.md)

### Leaderboard

The crowdAI Leaderboard is dynamic and may be configured via the Challenge configuration. The leaderboard rows are populated with:

- The highest scoring entry for each participant, for that challenge round
- Only graded scores are considered
- A clickable link displays the graded submission entries used to make up the leaderboard score

[More details](./leaderboard.md)

### Submissions

Submission information may be seen in four places:

TODO - insert screen shots

- Leaderboard row
- Leaderboard accordion submission row
- Submissions tab
- Submission Detail page

Access to submission information dependent on challenge configuration and running status, and is [detailed here](./leaderboard_submission_visibility.md).

A challenge can be configured to allow submissions via the Python Client or via the online submissions page (or both). Submissions can also be made [after the challenge round is over](./post_challenge_submissions.md).

### Submission Limits

[Detailed here](./submission_limits.md)

### Submission Detail Page

This page has a shortened url and buttons to share the page on Facebook, Twitter and other social media. For graded submissions, it is publicly viewable.

The page can have a number of components, depending on configuration settings and data stored on the submission row.

The links to the page are from:

- Leaderboard row
- Submissions row
- Media thumbnail on the leaderboard

The links will only be active if the **Submissions Details Visible?** switch is set in the Challenge configuration.

The possible elements, in the order the will appear are:

#### Header Section

![header](images/submissions/show/_header.png)

- always displayed
- participant name, admin / organizer badge, scores
- grading status badge
- media
- - Show scores only if challenges.show_leaderboard is true

Media is displayed only if the **Media on leaderboard?** configuration switch is set on the Challenge. If no media is available on the Submission, then a placeholder image (missing avatar) will be displayed.


#### Share Section

![header](images/submissions/show/_share.png)

Includes sharable buttons for Facebook and Twitter. Also has a copy button to access a shortened url for this page.

#### Description

This section is displayed if the ```submissions.description``` fields has content, and is rendered as HTML. This field is populated via the ```submissions.description_markdown``` field.

### Grading History

If the **Grading History Visible?** setting is on, then the scoring history for all entries for this participant will be displayed in a table. The current row is highlighted in bold.

### Grader Logs

If the **Grader Logs Visible?** flag is set on the challenge, and the ```submissions.meta``` field is set, then the page will try to load a logfile from S3 into a CodeMirror instance. The key is in the format:

```
grader_logs/{challenge.slug}/grader_logs_submission_{submission.id}.txt
```

## Technical Documentation

- [Architecture](./architecture.md)
- [Grading Overview](./grading_overview.md)
- [Grader API](./grader_api.md)
- [crowdAI API](./crowdai_api.md)
- [Media Objects](./media_objects_on_s3.md)
- [Markdown editor](./markdown_editor.md)
- [Launching a Challenge](./launching_a_challenge.md)
- [Challenge Configuration](./challenge_configuration.md)
- [Image Uploads](./image_uploads.md)
- [Code Repositories](./code_repositories.md)
- [GitLab-based Grading](./gitlab_based_grading.md)


## Contributing to Development

- [Getting Started](technical/getting_started.md)
