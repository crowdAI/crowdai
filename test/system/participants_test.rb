require "application_system_test_case"

class ParticipantsTest < ApplicationSystemTestCase
  setup do
    @participant = participants(:one)
  end

  test "visiting the index" do
    visit participants_url
    assert_selector "h1", text: "Participants"
  end

  test "creating a Participant" do
    visit participants_url
    click_on "New Participant"

    fill_in "Account Disabled", with: @participant.account_disabled
    fill_in "Account Disabled Dttm", with: @participant.account_disabled_dttm
    fill_in "Account Disabled Reason", with: @participant.account_disabled_reason
    fill_in "Address", with: @participant.address
    fill_in "Admin", with: @participant.admin
    fill_in "Affiliation", with: @participant.affiliation
    fill_in "Api Key", with: @participant.api_key
    fill_in "Bio", with: @participant.bio
    fill_in "City", with: @participant.city
    fill_in "Clef Email", with: @participant.clef_email
    fill_in "Confirmation Sent At", with: @participant.confirmation_sent_at
    fill_in "Confirmation Token", with: @participant.confirmation_token
    fill_in "Confirmed At", with: @participant.confirmed_at
    fill_in "Country Cd", with: @participant.country_cd
    fill_in "Email", with: @participant.email
    fill_in "Email Public", with: @participant.email_public
    fill_in "Encrypted Password", with: @participant.encrypted_password
    fill_in "Failed Attempts", with: @participant.failed_attempts
    fill_in "First Name", with: @participant.first_name
    fill_in "Github", with: @participant.github
    fill_in "Image File", with: @participant.image_file
    fill_in "Last Name", with: @participant.last_name
    fill_in "Level", with: @participant.level
    fill_in "Linkedin", with: @participant.linkedin
    fill_in "Locked At", with: @participant.locked_at
    fill_in "Name", with: @participant.name
    fill_in "Organizer", with: @participant.organizer_id
    fill_in "Remember Created At", with: @participant.remember_created_at
    fill_in "Reset Password Sent At", with: @participant.reset_password_sent_at
    fill_in "Reset Password Token", with: @participant.reset_password_token
    fill_in "Sash", with: @participant.sash_id
    fill_in "Slug", with: @participant.slug
    fill_in "Timezone", with: @participant.timezone
    fill_in "Twitter", with: @participant.twitter
    fill_in "Unconfirmed Email", with: @participant.unconfirmed_email
    fill_in "Unlock Token", with: @participant.unlock_token
    fill_in "Verification Date", with: @participant.verification_date
    fill_in "Verified", with: @participant.verified
    fill_in "Website", with: @participant.website
    click_on "Create Participant"

    assert_text "Participant was successfully created"
    click_on "Back"
  end

  test "updating a Participant" do
    visit participants_url
    click_on "Edit", match: :first

    fill_in "Account Disabled", with: @participant.account_disabled
    fill_in "Account Disabled Dttm", with: @participant.account_disabled_dttm
    fill_in "Account Disabled Reason", with: @participant.account_disabled_reason
    fill_in "Address", with: @participant.address
    fill_in "Admin", with: @participant.admin
    fill_in "Affiliation", with: @participant.affiliation
    fill_in "Api Key", with: @participant.api_key
    fill_in "Bio", with: @participant.bio
    fill_in "City", with: @participant.city
    fill_in "Clef Email", with: @participant.clef_email
    fill_in "Confirmation Sent At", with: @participant.confirmation_sent_at
    fill_in "Confirmation Token", with: @participant.confirmation_token
    fill_in "Confirmed At", with: @participant.confirmed_at
    fill_in "Country Cd", with: @participant.country_cd
    fill_in "Email", with: @participant.email
    fill_in "Email Public", with: @participant.email_public
    fill_in "Encrypted Password", with: @participant.encrypted_password
    fill_in "Failed Attempts", with: @participant.failed_attempts
    fill_in "First Name", with: @participant.first_name
    fill_in "Github", with: @participant.github
    fill_in "Image File", with: @participant.image_file
    fill_in "Last Name", with: @participant.last_name
    fill_in "Level", with: @participant.level
    fill_in "Linkedin", with: @participant.linkedin
    fill_in "Locked At", with: @participant.locked_at
    fill_in "Name", with: @participant.name
    fill_in "Organizer", with: @participant.organizer_id
    fill_in "Remember Created At", with: @participant.remember_created_at
    fill_in "Reset Password Sent At", with: @participant.reset_password_sent_at
    fill_in "Reset Password Token", with: @participant.reset_password_token
    fill_in "Sash", with: @participant.sash_id
    fill_in "Slug", with: @participant.slug
    fill_in "Timezone", with: @participant.timezone
    fill_in "Twitter", with: @participant.twitter
    fill_in "Unconfirmed Email", with: @participant.unconfirmed_email
    fill_in "Unlock Token", with: @participant.unlock_token
    fill_in "Verification Date", with: @participant.verification_date
    fill_in "Verified", with: @participant.verified
    fill_in "Website", with: @participant.website
    click_on "Update Participant"

    assert_text "Participant was successfully updated"
    click_on "Back"
  end

  test "destroying a Participant" do
    visit participants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Participant was successfully destroyed"
  end
end
