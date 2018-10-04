require "application_system_test_case"

class BadgeStatsTest < ApplicationSystemTestCase
  setup do
    @badge_stat = badge_stats(:one)
  end

  test "visiting the index" do
    visit badge_stats_url
    assert_selector "h1", text: "Badge Stats"
  end

  test "creating a Badge stat" do
    visit badge_stats_url
    click_on "New Badge Stat"

    fill_in "Badge Count", with: @badge_stat.badge_count
    fill_in "Badge", with: @badge_stat.badge_id
    fill_in "Participant Count", with: @badge_stat.participant_count
    fill_in "Percentile", with: @badge_stat.percentile
    click_on "Create Badge stat"

    assert_text "Badge stat was successfully created"
    click_on "Back"
  end

  test "updating a Badge stat" do
    visit badge_stats_url
    click_on "Edit", match: :first

    fill_in "Badge Count", with: @badge_stat.badge_count
    fill_in "Badge", with: @badge_stat.badge_id
    fill_in "Participant Count", with: @badge_stat.participant_count
    fill_in "Percentile", with: @badge_stat.percentile
    click_on "Update Badge stat"

    assert_text "Badge stat was successfully updated"
    click_on "Back"
  end

  test "destroying a Badge stat" do
    visit badge_stats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Badge stat was successfully destroyed"
  end
end
