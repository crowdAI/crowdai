require "application_system_test_case"

class ApplicationRecordsTest < ApplicationSystemTestCase
  setup do
    @application_record = application_records(:one)
  end

  test "visiting the index" do
    visit application_records_url
    assert_selector "h1", text: "Application Records"
  end

  test "creating a Application record" do
    visit application_records_url
    click_on "New Application Record"

    click_on "Create Application record"

    assert_text "Application record was successfully created"
    click_on "Back"
  end

  test "updating a Application record" do
    visit application_records_url
    click_on "Edit", match: :first

    click_on "Update Application record"

    assert_text "Application record was successfully updated"
    click_on "Back"
  end

  test "destroying a Application record" do
    visit application_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Application record was successfully destroyed"
  end
end
