require 'test_helper'

class OrganizersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organizer = organizers(:one)
  end

  test "should get index" do
    get organizers_url
    assert_response :success
  end

  test "should get new" do
    get new_organizer_url
    assert_response :success
  end

  test "should create organizer" do
    assert_difference('Organizer.count') do
      post organizers_url, params: { organizer: { address: @organizer.address, api_key: @organizer.api_key, approved: @organizer.approved, challenge_proposal: @organizer.challenge_proposal, clef_organizer: @organizer.clef_organizer, description: @organizer.description, image_file: @organizer.image_file, organizer: @organizer.organizer, slug: @organizer.slug, tagline: @organizer.tagline } }
    end

    assert_redirected_to organizer_url(Organizer.last)
  end

  test "should show organizer" do
    get organizer_url(@organizer)
    assert_response :success
  end

  test "should get edit" do
    get edit_organizer_url(@organizer)
    assert_response :success
  end

  test "should update organizer" do
    patch organizer_url(@organizer), params: { organizer: { address: @organizer.address, api_key: @organizer.api_key, approved: @organizer.approved, challenge_proposal: @organizer.challenge_proposal, clef_organizer: @organizer.clef_organizer, description: @organizer.description, image_file: @organizer.image_file, organizer: @organizer.organizer, slug: @organizer.slug, tagline: @organizer.tagline } }
    assert_redirected_to organizer_url(@organizer)
  end

  test "should destroy organizer" do
    assert_difference('Organizer.count', -1) do
      delete organizer_url(@organizer)
    end

    assert_redirected_to organizers_url
  end
end
