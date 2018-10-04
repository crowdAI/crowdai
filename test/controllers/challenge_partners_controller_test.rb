require 'test_helper'

class ChallengePartnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @challenge_partner = challenge_partners(:one)
  end

  test "should get index" do
    get challenge_partners_url
    assert_response :success
  end

  test "should get new" do
    get new_challenge_partner_url
    assert_response :success
  end

  test "should create challenge_partner" do
    assert_difference('ChallengePartner.count') do
      post challenge_partners_url, params: { challenge_partner: { challenge_id: @challenge_partner.challenge_id, image_file: @challenge_partner.image_file, partner_url: @challenge_partner.partner_url } }
    end

    assert_redirected_to challenge_partner_url(ChallengePartner.last)
  end

  test "should show challenge_partner" do
    get challenge_partner_url(@challenge_partner)
    assert_response :success
  end

  test "should get edit" do
    get edit_challenge_partner_url(@challenge_partner)
    assert_response :success
  end

  test "should update challenge_partner" do
    patch challenge_partner_url(@challenge_partner), params: { challenge_partner: { challenge_id: @challenge_partner.challenge_id, image_file: @challenge_partner.image_file, partner_url: @challenge_partner.partner_url } }
    assert_redirected_to challenge_partner_url(@challenge_partner)
  end

  test "should destroy challenge_partner" do
    assert_difference('ChallengePartner.count', -1) do
      delete challenge_partner_url(@challenge_partner)
    end

    assert_redirected_to challenge_partners_url
  end
end
