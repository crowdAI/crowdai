require "application_system_test_case"

class JobPostingsTest < ApplicationSystemTestCase
  setup do
    @job_posting = job_postings(:one)
  end

  test "visiting the index" do
    visit job_postings_url
    assert_selector "h1", text: "Job Postings"
  end

  test "creating a Job posting" do
    visit job_postings_url
    click_on "New Job Posting"

    fill_in "Closing Date", with: @job_posting.closing_date
    fill_in "Contact Email", with: @job_posting.contact_email
    fill_in "Contact Name", with: @job_posting.contact_name
    fill_in "Contact Phone", with: @job_posting.contact_phone
    fill_in "Country", with: @job_posting.country
    fill_in "Description", with: @job_posting.description
    fill_in "Job Url", with: @job_posting.job_url
    fill_in "Location", with: @job_posting.location
    fill_in "Organisation", with: @job_posting.organisation
    fill_in "Page Views", with: @job_posting.page_views
    fill_in "Posting Date", with: @job_posting.posting_date
    fill_in "Remote", with: @job_posting.remote
    fill_in "Status Cd", with: @job_posting.status_cd
    fill_in "Title", with: @job_posting.title
    click_on "Create Job posting"

    assert_text "Job posting was successfully created"
    click_on "Back"
  end

  test "updating a Job posting" do
    visit job_postings_url
    click_on "Edit", match: :first

    fill_in "Closing Date", with: @job_posting.closing_date
    fill_in "Contact Email", with: @job_posting.contact_email
    fill_in "Contact Name", with: @job_posting.contact_name
    fill_in "Contact Phone", with: @job_posting.contact_phone
    fill_in "Country", with: @job_posting.country
    fill_in "Description", with: @job_posting.description
    fill_in "Job Url", with: @job_posting.job_url
    fill_in "Location", with: @job_posting.location
    fill_in "Organisation", with: @job_posting.organisation
    fill_in "Page Views", with: @job_posting.page_views
    fill_in "Posting Date", with: @job_posting.posting_date
    fill_in "Remote", with: @job_posting.remote
    fill_in "Status Cd", with: @job_posting.status_cd
    fill_in "Title", with: @job_posting.title
    click_on "Update Job posting"

    assert_text "Job posting was successfully updated"
    click_on "Back"
  end

  test "destroying a Job posting" do
    visit job_postings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job posting was successfully destroyed"
  end
end
