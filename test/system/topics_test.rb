require "application_system_test_case"

class TopicsTest < ApplicationSystemTestCase
  setup do
    @topic = topics(:one)
  end

  test "visiting the index" do
    visit topics_url
    assert_selector "h1", text: "Topics"
  end

  test "creating a Topic" do
    visit topics_url
    click_on "New Topic"

    fill_in "Challenge", with: @topic.challenge_id
    fill_in "Participant", with: @topic.participant_id
    fill_in "Posts Count", with: @topic.posts_count
    fill_in "Slug", with: @topic.slug
    fill_in "Sticky", with: @topic.sticky
    fill_in "Topic", with: @topic.topic
    fill_in "Views", with: @topic.views
    fill_in "Vote Count", with: @topic.vote_count
    click_on "Create Topic"

    assert_text "Topic was successfully created"
    click_on "Back"
  end

  test "updating a Topic" do
    visit topics_url
    click_on "Edit", match: :first

    fill_in "Challenge", with: @topic.challenge_id
    fill_in "Participant", with: @topic.participant_id
    fill_in "Posts Count", with: @topic.posts_count
    fill_in "Slug", with: @topic.slug
    fill_in "Sticky", with: @topic.sticky
    fill_in "Topic", with: @topic.topic
    fill_in "Views", with: @topic.views
    fill_in "Vote Count", with: @topic.vote_count
    click_on "Update Topic"

    assert_text "Topic was successfully updated"
    click_on "Back"
  end

  test "destroying a Topic" do
    visit topics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Topic was successfully destroyed"
  end
end
