## Challenge Configuration

### Grader

This determines which grading algorithm is applied to the challenge. It may also be manual in which case the grades and entered manually from the leaderboard view.

### Answer File

For some challenges the submission will be compared to a known answer file. The grading algorithm will be chosen from a list.

### Regrade Button

Pressing this button will re-run the grading for all received submissions.  This might be executed if the answer file was changed or the Grading Factor changed.


### Grading Factor

A grading factor less than 1.0 indicates that only a part of the submitted answer will be graded. This is for both grading performance reasons and to prevent participants from overfitting their submissions.

At the end of the challenge the grading factor is manually set to 1.0, at which time all submissions will be re-graded using the Regrade button.

### Perpetual Challenge

If a challenge is marked ongoing, submissions can be made after the end of the challenge. In this case there is a leaderboard with two tabs, with one tab indicating post-challenge submissions.

### Primary and Secondary Scores

A challenge will have one scoring dimensions and optionally a second. This is configured using the scoring configuration fields:

- Primary Score Title
- Primary Score Order
- Secondary Score Title
- Secondary Score Order
