require "application_system_test_case"

class SqlViewsTest < ApplicationSystemTestCase
  setup do
    @sql_view = sql_views(:one)
  end

  test "visiting the index" do
    visit sql_views_url
    assert_selector "h1", text: "Sql Views"
  end

  test "creating a Sql view" do
    visit sql_views_url
    click_on "New Sql View"

    click_on "Create Sql view"

    assert_text "Sql view was successfully created"
    click_on "Back"
  end

  test "updating a Sql view" do
    visit sql_views_url
    click_on "Edit", match: :first

    click_on "Update Sql view"

    assert_text "Sql view was successfully updated"
    click_on "Back"
  end

  test "destroying a Sql view" do
    visit sql_views_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sql view was successfully destroyed"
  end
end
