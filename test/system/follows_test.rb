require "application_system_test_case"

class FollowsTest < ApplicationSystemTestCase
  setup do
    @follow = follows(:one)
  end

  test "visiting the index" do
    visit follows_url
    assert_selector "h1", text: "Follows"
  end

  test "creating a Follow" do
    visit follows_url
    click_on "New Follow"

    fill_in "Followable", with: @follow.followable_id
    fill_in "Followable Type", with: @follow.followable_type
    fill_in "Participant", with: @follow.participant_id
    click_on "Create Follow"

    assert_text "Follow was successfully created"
    click_on "Back"
  end

  test "updating a Follow" do
    visit follows_url
    click_on "Edit", match: :first

    fill_in "Followable", with: @follow.followable_id
    fill_in "Followable Type", with: @follow.followable_type
    fill_in "Participant", with: @follow.participant_id
    click_on "Update Follow"

    assert_text "Follow was successfully updated"
    click_on "Back"
  end

  test "destroying a Follow" do
    visit follows_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Follow was successfully destroyed"
  end
end
