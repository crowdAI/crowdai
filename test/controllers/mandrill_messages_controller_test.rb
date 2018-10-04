require 'test_helper'

class MandrillMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mandrill_message = mandrill_messages(:one)
  end

  test "should get index" do
    get mandrill_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_mandrill_message_url
    assert_response :success
  end

  test "should create mandrill_message" do
    assert_difference('MandrillMessage.count') do
      post mandrill_messages_url, params: { mandrill_message: { message: @mandrill_message.message, meta: @mandrill_message.meta, participant_id: @mandrill_message.participant_id, res: @mandrill_message.res } }
    end

    assert_redirected_to mandrill_message_url(MandrillMessage.last)
  end

  test "should show mandrill_message" do
    get mandrill_message_url(@mandrill_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_mandrill_message_url(@mandrill_message)
    assert_response :success
  end

  test "should update mandrill_message" do
    patch mandrill_message_url(@mandrill_message), params: { mandrill_message: { message: @mandrill_message.message, meta: @mandrill_message.meta, participant_id: @mandrill_message.participant_id, res: @mandrill_message.res } }
    assert_redirected_to mandrill_message_url(@mandrill_message)
  end

  test "should destroy mandrill_message" do
    assert_difference('MandrillMessage.count', -1) do
      delete mandrill_message_url(@mandrill_message)
    end

    assert_redirected_to mandrill_messages_url
  end
end
