require "application_system_test_case"

class MandrillMessagesTest < ApplicationSystemTestCase
  setup do
    @mandrill_message = mandrill_messages(:one)
  end

  test "visiting the index" do
    visit mandrill_messages_url
    assert_selector "h1", text: "Mandrill Messages"
  end

  test "creating a Mandrill message" do
    visit mandrill_messages_url
    click_on "New Mandrill Message"

    fill_in "Message", with: @mandrill_message.message
    fill_in "Meta", with: @mandrill_message.meta
    fill_in "Participant", with: @mandrill_message.participant_id
    fill_in "Res", with: @mandrill_message.res
    click_on "Create Mandrill message"

    assert_text "Mandrill message was successfully created"
    click_on "Back"
  end

  test "updating a Mandrill message" do
    visit mandrill_messages_url
    click_on "Edit", match: :first

    fill_in "Message", with: @mandrill_message.message
    fill_in "Meta", with: @mandrill_message.meta
    fill_in "Participant", with: @mandrill_message.participant_id
    fill_in "Res", with: @mandrill_message.res
    click_on "Update Mandrill message"

    assert_text "Mandrill message was successfully updated"
    click_on "Back"
  end

  test "destroying a Mandrill message" do
    visit mandrill_messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mandrill message was successfully destroyed"
  end
end
