require "application_system_test_case"

class ParticipantChallengesTest < ApplicationSystemTestCase
  setup do
    @participant_challenge = participant_challenges(:one)
  end

  test "visiting the index" do
    visit participant_challenges_url
    assert_selector "h1", text: "Participant Challenges"
  end

  test "creating a Participant challenge" do
    visit participant_challenges_url
    click_on "New Participant Challenge"

    fill_in "Bio", with: @participant_challenge.bio
    fill_in "Challenge", with: @participant_challenge.challenge
    fill_in "Challenge", with: @participant_challenge.challenge_id
    fill_in "Description", with: @participant_challenge.description
    fill_in "Email", with: @participant_challenge.email
    fill_in "Github", with: @participant_challenge.github
    fill_in "Image File", with: @participant_challenge.image_file
    fill_in "Linkedin", with: @participant_challenge.linkedin
    fill_in "Name", with: @participant_challenge.name
    fill_in "Organizer", with: @participant_challenge.organizer_id
    fill_in "Page Views", with: @participant_challenge.page_views
    fill_in "Participant Count", with: @participant_challenge.participant_count
    fill_in "Participant", with: @participant_challenge.participant_id
    fill_in "Private Challenge", with: @participant_challenge.private_challenge
    fill_in "Prizes", with: @participant_challenge.prizes
    fill_in "Resources", with: @participant_challenge.resources
    fill_in "Rules", with: @participant_challenge.rules
    fill_in "Status Cd", with: @participant_challenge.status_cd
    fill_in "Submission Count", with: @participant_challenge.submission_count
    fill_in "Tagline", with: @participant_challenge.tagline
    fill_in "Twitter", with: @participant_challenge.twitter
    click_on "Create Participant challenge"

    assert_text "Participant challenge was successfully created"
    click_on "Back"
  end

  test "updating a Participant challenge" do
    visit participant_challenges_url
    click_on "Edit", match: :first

    fill_in "Bio", with: @participant_challenge.bio
    fill_in "Challenge", with: @participant_challenge.challenge
    fill_in "Challenge", with: @participant_challenge.challenge_id
    fill_in "Description", with: @participant_challenge.description
    fill_in "Email", with: @participant_challenge.email
    fill_in "Github", with: @participant_challenge.github
    fill_in "Image File", with: @participant_challenge.image_file
    fill_in "Linkedin", with: @participant_challenge.linkedin
    fill_in "Name", with: @participant_challenge.name
    fill_in "Organizer", with: @participant_challenge.organizer_id
    fill_in "Page Views", with: @participant_challenge.page_views
    fill_in "Participant Count", with: @participant_challenge.participant_count
    fill_in "Participant", with: @participant_challenge.participant_id
    fill_in "Private Challenge", with: @participant_challenge.private_challenge
    fill_in "Prizes", with: @participant_challenge.prizes
    fill_in "Resources", with: @participant_challenge.resources
    fill_in "Rules", with: @participant_challenge.rules
    fill_in "Status Cd", with: @participant_challenge.status_cd
    fill_in "Submission Count", with: @participant_challenge.submission_count
    fill_in "Tagline", with: @participant_challenge.tagline
    fill_in "Twitter", with: @participant_challenge.twitter
    click_on "Update Participant challenge"

    assert_text "Participant challenge was successfully updated"
    click_on "Back"
  end

  test "destroying a Participant challenge" do
    visit participant_challenges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Participant challenge was successfully destroyed"
  end
end
