## Leaderboard and Submission Visibility

There are three interrelated pages for submissions, scores and leaderboards. Access to this data is controlled by ApplicationPolicy objects and challenge configurations.

### Leaderboard

The default setting for the leaderboard is that all users, including public users, can see the leaderboard for a challenge. This includes the scores, leaderboard position, number of submissions and carries a link to the submission detail page for the top score.

For the organizer, admin and the participant themselves, the number of submissions can be clicked to open an accordion of submissions which the participant has made.

When the challenge is over, all users (including public) are able to see the submission rows on the leaderboard.

If the **challenges.show_leaderboard** setting is off, the leaderboard is viewable only by admins and challenge organizers.

### Submissions

During the challenge each participant can see only their own information on the submissions page. The includes information around the current grading status. It is possible to provide scoring details in the message field, and this is controlled by the grader code.

If the score should not be seen, then then grader code should not send it.

### Submissions Detail

This page is usually a public, sharable view of details about the submission, including visualizations, logfiles, grading status and scores.

The visibility for this page is controlled via the **challenges.submissions_page** configuration setting. If set to OFF, the page is completely inaccessible, even to admins.
