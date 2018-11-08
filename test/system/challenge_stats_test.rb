require "application_system_test_case"

class ChallengeStatsTest < ApplicationSystemTestCase
  setup do
    @challenge_stat = challenge_stats(:one)
  end

  test "visiting the index" do
    visit challenge_stats_url
    assert_selector "h1", text: "Challenge Stats"
  end

  test "creating a Challenge stat" do
    visit challenge_stats_url
    click_on "New Challenge Stat"

    fill_in "Challenge", with: @challenge_stat.challenge
    fill_in "Challenge", with: @challenge_stat.challenge_id
    fill_in "Challenge Round", with: @challenge_stat.challenge_round
    fill_in "Challenge Round", with: @challenge_stat.challenge_round_id
    fill_in "Duration", with: @challenge_stat.duration
    fill_in "End Dttm", with: @challenge_stat.end_dttm
    fill_in "Participants", with: @challenge_stat.participants
    fill_in "Start Dttm", with: @challenge_stat.start_dttm
    fill_in "Submissions", with: @challenge_stat.submissions
    click_on "Create Challenge stat"

    assert_text "Challenge stat was successfully created"
    click_on "Back"
  end

  test "updating a Challenge stat" do
    visit challenge_stats_url
    click_on "Edit", match: :first

    fill_in "Challenge", with: @challenge_stat.challenge
    fill_in "Challenge", with: @challenge_stat.challenge_id
    fill_in "Challenge Round", with: @challenge_stat.challenge_round
    fill_in "Challenge Round", with: @challenge_stat.challenge_round_id
    fill_in "Duration", with: @challenge_stat.duration
    fill_in "End Dttm", with: @challenge_stat.end_dttm
    fill_in "Participants", with: @challenge_stat.participants
    fill_in "Start Dttm", with: @challenge_stat.start_dttm
    fill_in "Submissions", with: @challenge_stat.submissions
    click_on "Update Challenge stat"

    assert_text "Challenge stat was successfully updated"
    click_on "Back"
  end

  test "destroying a Challenge stat" do
    visit challenge_stats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Challenge stat was successfully destroyed"
  end
end
