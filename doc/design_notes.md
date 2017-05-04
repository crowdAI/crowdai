Changes made
- id instead of class for load-more
- removed category from articles masthead and index page
- Removed Follow and Share buttons
- Added tabs CSS and JS
- Hid superscript counts for participants when = 0
- Like count for discussions is total of topic.likes + comments.likes

Requests
- change the active tab CSS on challenges
- Submit button for comments
- Need a create Topic page

Suggestions
- instead of stacking the article section titles, can we have a slider?
- Remove the superscript on the article section titles
- Additional default images, eg: for challenges, tutorials
- Contact page is a bit short... should we add some content here?
- Use type=password for password fields (and add CSS )
<input type="text" name="" placeholder="Password">



Questions
- What to do about the shorter sections in tutorials ... see example. Should the page be set to a default height (perhaps viewport height)?
- Rails is rendering [alt=""] as [alt] - is this OK?
<img src="assets/img/tutorials/tutorial-2.jpg" alt="">
- How to handle history links on challenges (currently missing)
- How to handle errors on multi-tab forms?
- How does the challenge header look when the challenge is ended or in draft?
- challenge days remaining (already logged in Basecamp)
- We dont' currently display the challenge end time to the participants.
- We currently accept markdown for the discussion comments. Should we display the markdown editor or just have a markdown enabled field. If markdown enabled only should we include placeholder text like 'You can use markdown here'
- Form error messages. Do we have a top level error message as well as field-level messages?
- Deletions for dataset files. Should there be a delete button on the index page. No edit is required.
