## Application Documentation

- [Hosting institutions](hosting_institutions.md)
- [Dynamic content](dynamic_content.md)

### Leaderboard

The crowdAI Leaderboard is dynamic and may be configured via the Challenge configuration. The leaderboard rows are populated with:

- The highest scoring entry for each participant, for that challenge round
- Only graded scores are considered
- A clickable link displays the graded submission entries used to make up the leaderboard score

### Submissions

- During the challenge, the content of the submissions page is viewable only by:

- The participant themselves
- The organizers
- The Admin

### Submission Limits

Detailed [here](./submission_limits.md)

### Submission Detail Page

This page has a shortened url and buttons to share the page on Facebook, Twitter and other social media. For graded submissions, it is publicly viewable.

The page can have a number of components, depending on configuration settings and data stored on the submission row.

The links to the page are from:

- Leaderboard row
- Submissions row
- Media thumbnail on the leaderboard

The links will only be active if the **
Submissions Details Visible?** switch is set in the Challenge configuration.

The possible elements, in the order the will appear are:

#### Header Section

![header](images/submissions/show/_header.png)

- always displayed
- participant name, admin / organizer badge, scores
- grading status badge
- media

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

- [Leaderboard](leaderboard.md)
- [Email preferences](email_preferences.md)
- [Entity-Relationship Diagram](erd.pdf)
- [Grader API](grader_api.md)
- [Image uploads](image_uploads.md)

## Contributing to Development

- [Getting Started](technical/getting_started.md)
