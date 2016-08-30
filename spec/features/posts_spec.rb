require "rails_helper"


RSpec.feature "topic", type: :feature do
  before(:each) do
    @participant = create :participant
    @admin_participant = create :participant, :admin
    @challenge = create :challenge, :with_events
    @login_page = DeviseSessionsNew.new
    @running_challenge = create :challenge, :with_events
  end


  describe "creation" do
    scenario "a participant can create a post" do
      @login_page.visit_page.login(@participant)
      topics = TopicsPages.new
      topics.index(@challenge)
      click_link "+ New Topic"
      fill_in "Topic", with: "Post test"
      click_button "Create Topic"
      expect(page).to have_content("Topic was successfully created.")
      click_link "Post test"
      expect(page).to have_content("Post test")
      find('#markdown_textarea').set('### Markdown Heading')
      click_button "Create Post"
      expect(page).to have_selector("h3", text: "Markdown Heading")
      expect(page).to have_content("Post was successfully created.")
    end


    scenario "a participant can respond to a post" do
      @login_page.visit_page.login(@participant)
      @topic = create :topic, :with_posts
      @topic.challenge = @running_challenge
      @topic.save
      visit new_topic_post_path(@topic)
      expect(page).to have_content(@topic.topic)
      find('#markdown_textarea').set('## Post Reply Test')
      click_button "Create Post"
      expect(page).to have_selector("h2", text: "Post Reply Test")
      expect(page).to have_content("Post was successfully created.")
    end
  end

end
