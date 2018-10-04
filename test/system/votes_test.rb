require "application_system_test_case"

class VotesTest < ApplicationSystemTestCase
  setup do
    @vote = votes(:one)
  end

  test "visiting the index" do
    visit votes_url
    assert_selector "h1", text: "Votes"
  end

  test "creating a Vote" do
    visit votes_url
    click_on "New Vote"

    fill_in "Participant", with: @vote.participant_id
    fill_in "Votable", with: @vote.votable_id
    fill_in "Votable Type", with: @vote.votable_type
    click_on "Create Vote"

    assert_text "Vote was successfully created"
    click_on "Back"
  end

  test "updating a Vote" do
    visit votes_url
    click_on "Edit", match: :first

    fill_in "Participant", with: @vote.participant_id
    fill_in "Votable", with: @vote.votable_id
    fill_in "Votable Type", with: @vote.votable_type
    click_on "Update Vote"

    assert_text "Vote was successfully updated"
    click_on "Back"
  end

  test "destroying a Vote" do
    visit votes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vote was successfully destroyed"
  end
end
