require "rails_helper"
=begin
feature 'Posts CRUD', js: true do

  let!(:participant) { create(:participant) }
  let!(:challenge) { create(:challenge) }

  describe "as a participant" do
    before(:example) do
      visit_challenge(participant,challenge)
    end

    scenario "a participant can create a post" do
      find("#glyphicon-link-discussion").click
      click_link "+ New Topic"
      fill_in "Topic", with: "Post test"
      click_button "Create Topic"
      expect(page).to have_content("Topic was successfully created.")
      click_link "Post test"
      expect(page).to have_content("Post test")
      find('.markdown-textarea').set('### Markdown Heading')
      click_button "Create Post"
      expect(page).to have_selector("h3", text: "Markdown Heading")
      expect(page).to have_content("Post was successfully created.")
    end
  end

end
=end
