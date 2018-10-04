require "application_system_test_case"

class MaterializedViewsTest < ApplicationSystemTestCase
  setup do
    @materialized_view = materialized_views(:one)
  end

  test "visiting the index" do
    visit materialized_views_url
    assert_selector "h1", text: "Materialized Views"
  end

  test "creating a Materialized view" do
    visit materialized_views_url
    click_on "New Materialized View"

    click_on "Create Materialized view"

    assert_text "Materialized view was successfully created"
    click_on "Back"
  end

  test "updating a Materialized view" do
    visit materialized_views_url
    click_on "Edit", match: :first

    click_on "Update Materialized view"

    assert_text "Materialized view was successfully updated"
    click_on "Back"
  end

  test "destroying a Materialized view" do
    visit materialized_views_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Materialized view was successfully destroyed"
  end
end
