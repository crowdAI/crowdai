require 'test_helper'

class OrganizerApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organizer_application = organizer_applications(:one)
  end

  test "should get index" do
    get organizer_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_organizer_application_url
    assert_response :success
  end

  test "should create organizer_application" do
    assert_difference('OrganizerApplication.count') do
      post organizer_applications_url, params: { organizer_application: { challenge_description: @organizer_application.challenge_description, contact_name: @organizer_application.contact_name, email: @organizer_application.email, organization: @organizer_application.organization, organization_description: @organizer_application.organization_description, phone: @organizer_application.phone } }
    end

    assert_redirected_to organizer_application_url(OrganizerApplication.last)
  end

  test "should show organizer_application" do
    get organizer_application_url(@organizer_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_organizer_application_url(@organizer_application)
    assert_response :success
  end

  test "should update organizer_application" do
    patch organizer_application_url(@organizer_application), params: { organizer_application: { challenge_description: @organizer_application.challenge_description, contact_name: @organizer_application.contact_name, email: @organizer_application.email, organization: @organizer_application.organization, organization_description: @organizer_application.organization_description, phone: @organizer_application.phone } }
    assert_redirected_to organizer_application_url(@organizer_application)
  end

  test "should destroy organizer_application" do
    assert_difference('OrganizerApplication.count', -1) do
      delete organizer_application_url(@organizer_application)
    end

    assert_redirected_to organizer_applications_url
  end
end
