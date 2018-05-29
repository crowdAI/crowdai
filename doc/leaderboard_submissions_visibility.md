## Leaderboard and Submission Visibility

There are three interrelated pages for submissions, scores and leaderboards. Access to this data is controlled by ApplicationPolicy objects and challenge configurations.

### Leaderboard

The default setting for the leaderboard is that all users, including public users, can see the leaderboard for a challenge (**challenges.show_leaderboard** setting is on). This includes the scores, leaderboard position, number of submissions and carries a link to the submission detail page for the top score.

The number of submissions on the leaderboard can also be clicked (everyone) to open an accordion of submissions which the participant has made.

The grader knows that score, score_secondary, message will be viewable by everyone, and hence will ensure no sensitive information is added there. The `meta` param might have sensitive information though.

If the **challenges.show_leaderboard** setting is off, the leaderboard is viewable only by admins and challenge organizers.

### Submissions

When **challenges.show_leaderboard** setting is on :   
Every participant (signed in or other wise) can see all the details about the submission (score, score secondary, grading_status, message, associated media). In case of gitlab-grader related submissions, private information related to the submission, if any, will added to the corresponding issue (on gitlab) for every submission to which only the participant will have access.  

When **challenges.show_leaderboard** setting is off :  
Only admins and organisers can view anything at all about the submission.
Participants can see *just* their `grarding_status`, and `grading_message`. This is to ensure that participants get some feedback if their submission was successful or not; but not any feedback about their scores.


### Submissions Detail

This page is usually a public, sharable view of details about the submission, including visualizations, logfiles, grading status and scores.

The visibility for this page is controlled via the **challenges.submissions_page** configuration setting. If set to OFF, the page is completely inaccessible, even to admins.
When challenge **challenges.show_leaderboard** is off, then *only* admins and organisers should have access to this unless any other setting overrides this.
