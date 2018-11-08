require "application_system_test_case"

class ChallengePartnersTest < ApplicationSystemTestCase
  setup do
    @challenge_partner = challenge_partners(:one)
  end

  test "visiting the index" do
    visit challenge_partners_url
    assert_selector "h1", text: "Challenge Partners"
  end

  test "creating a Challenge partner" do
    visit challenge_partners_url
    click_on "New Challenge Partner"

    fill_in "Challenge", with: @challenge_partner.challenge_id
    fill_in "Image File", with: @challenge_partner.image_file
    fill_in "Partner Url", with: @challenge_partner.partner_url
    click_on "Create Challenge partner"

    assert_text "Challenge partner was successfully created"
    click_on "Back"
  end

  test "updating a Challenge partner" do
    visit challenge_partners_url
    click_on "Edit", match: :first

    fill_in "Challenge", with: @challenge_partner.challenge_id
    fill_in "Image File", with: @challenge_partner.image_file
    fill_in "Partner Url", with: @challenge_partner.partner_url
    click_on "Update Challenge partner"

    assert_text "Challenge partner was successfully updated"
    click_on "Back"
  end

  test "destroying a Challenge partner" do
    visit challenge_partners_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Challenge partner was successfully destroyed"
  end
end
