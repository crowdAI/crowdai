require "rails_helper"

feature 'Topics CRUD', js: true do

  let!(:participant) { create(:participant) }
  let!(:admin) { create(:participant, :admin) }
  let!(:challenge) { create(:challenge, :with_events) }

  describe "as a participant" do
    before(:example) do
      visit_challenge(participant,challenge)
    end

    scenario "create a topic" do
      find("#glyphicon-link-discussion").click
      click_link "+ New Topic"
      fill_in "Topic", with: "Sample topic"
      click_button "Create Topic"
      expect(page).to have_content("Topic was successfully created.")
    end

    scenario "a participant cannot update a topic to 'sticky'" do
      find("#glyphicon-link-discussion").click
      click_link "+ New Topic"
      fill_in "Topic", with: "Sample topic"
      click_button "Create Topic"
      expect(page).to_not have_selector('#topic_sticky')
    end

    scenario "a participant cannot update or delete a topic" do
      find("#glyphicon-link-discussion").click
      click_link "+ New Topic"
      fill_in "Topic", with: "Sample topic"
      click_button "Create Topic"
      expect(page).to have_content("Topic was successfully created.")
      expect(page).to_not have_link('Edit')
      expect(page).to_not have_link('Delete')
    end
  end

  describe "as an admin" do
    before(:example) do
      visit_challenge(admin,challenge)
    end

    scenario "an admin can update a topic to 'sticky'" do
      find("#glyphicon-link-discussion").click
      click_link "+ New Topic"
      fill_in "Topic", with: "Sample topic"
      check('Sticky')
      click_button "Create Topic"
      expect(page).to have_content("Topic was successfully created.")
      expect(page).to have_css('.fa-thumb-tack')
    end

    scenario "a admin can see update and delete topic links" do
      find("#glyphicon-link-discussion").click
      click_link "+ New Topic"
      fill_in "Topic", with: "Sample topic"
      click_button "Create Topic"
      expect(page).to have_content("Topic was successfully created.")
      expect(page).to have_link('Edit')
      expect(page).to have_link('Delete')
    end

  end

end


=begin

RSpec.feature "topic", type: :feature do
  before(:each) do
    @participant = create :participant
    @admin_participant = create :participant, :admin
    @organizer =  create :organizer
    @second_organizer = create :organizer, :second_organizer
    @organizer_participant = create :participant, organizer_id: @organizer.id
    @running_challenge = create :challenge, :with_events
    @login_page = DeviseSessionsNew.new
  end

  describe "creation" do
    scenario "a participant can create a topic" do
      @login_page.visit_page.login(@participant)
      topics = TopicsPages.new
      topics.index(@running_challenge)
      click_link "+ New Topic"
      fill_in "Topic", with: "Sample topic"
      click_button "Create Topic"
      expect(page).to have_content("Topic was successfully created.")
    end

    scenario "a non-admin cannot update a topic to 'sticky'" do
      @login_page.visit_page.login(@participant)
      topics = TopicsPages.new
      topics.index(@running_challenge)
      click_link "+ New Topic"
      fill_in "Topic", with: "Sample topic"
      expect(page).to_not have_selector('#topic_sticky')
    end

    scenario "an admin can update a topic to 'sticky'" do
      @login_page.visit_page.login(@admin_participant)
      topics = TopicsPages.new
      topics.index(@running_challenge)
      click_link "+ New Topic"
      fill_in "Topic", with: "Sample topic"
      check('Sticky')
      click_button "Create Topic"
      expect(page).to have_content("Topic was successfully created.")
      expect(page).to have_css('.fa-thumb-tack')
    end

    scenario "a non-admin cannot update or delete a topic" do
      @login_page.visit_page.login(@participant)
      topics = TopicsPages.new
      topics.index(@running_challenge)
      click_link "+ New Topic"
      fill_in "Topic", with: "Sample topic"
      click_button "Create Topic"
      expect(page).to have_content("Topic was successfully created.")
      expect(page).to_not have_link('Edit')
      expect(page).to_not have_link('Delete')
    end

    scenario "a admin can update or delete a topic" do
      @login_page.visit_page.login(@admin_participant)
      topics = TopicsPages.new
      topics.index(@running_challenge)
      click_link "+ New Topic"
      fill_in "Topic", with: "Sample topic"
      click_button "Create Topic"
      expect(page).to have_content("Topic was successfully created.")
      expect(page).to have_link('Edit')
      expect(page).to have_link('Delete')
    end

  end

end

=end
