require 'test_helper'

class ParticipantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participant = participants(:one)
  end

  test "should get index" do
    get participants_url
    assert_response :success
  end

  test "should get new" do
    get new_participant_url
    assert_response :success
  end

  test "should create participant" do
    assert_difference('Participant.count') do
      post participants_url, params: { participant: { account_disabled: @participant.account_disabled, account_disabled_dttm: @participant.account_disabled_dttm, account_disabled_reason: @participant.account_disabled_reason, address: @participant.address, admin: @participant.admin, affiliation: @participant.affiliation, api_key: @participant.api_key, bio: @participant.bio, city: @participant.city, clef_email: @participant.clef_email, confirmation_sent_at: @participant.confirmation_sent_at, confirmation_token: @participant.confirmation_token, confirmed_at: @participant.confirmed_at, country_cd: @participant.country_cd, email: @participant.email, email_public: @participant.email_public, encrypted_password: @participant.encrypted_password, failed_attempts: @participant.failed_attempts, first_name: @participant.first_name, github: @participant.github, image_file: @participant.image_file, last_name: @participant.last_name, level: @participant.level, linkedin: @participant.linkedin, locked_at: @participant.locked_at, name: @participant.name, organizer_id: @participant.organizer_id, remember_created_at: @participant.remember_created_at, reset_password_sent_at: @participant.reset_password_sent_at, reset_password_token: @participant.reset_password_token, sash_id: @participant.sash_id, slug: @participant.slug, timezone: @participant.timezone, twitter: @participant.twitter, unconfirmed_email: @participant.unconfirmed_email, unlock_token: @participant.unlock_token, verification_date: @participant.verification_date, verified: @participant.verified, website: @participant.website } }
    end

    assert_redirected_to participant_url(Participant.last)
  end

  test "should show participant" do
    get participant_url(@participant)
    assert_response :success
  end

  test "should get edit" do
    get edit_participant_url(@participant)
    assert_response :success
  end

  test "should update participant" do
    patch participant_url(@participant), params: { participant: { account_disabled: @participant.account_disabled, account_disabled_dttm: @participant.account_disabled_dttm, account_disabled_reason: @participant.account_disabled_reason, address: @participant.address, admin: @participant.admin, affiliation: @participant.affiliation, api_key: @participant.api_key, bio: @participant.bio, city: @participant.city, clef_email: @participant.clef_email, confirmation_sent_at: @participant.confirmation_sent_at, confirmation_token: @participant.confirmation_token, confirmed_at: @participant.confirmed_at, country_cd: @participant.country_cd, email: @participant.email, email_public: @participant.email_public, encrypted_password: @participant.encrypted_password, failed_attempts: @participant.failed_attempts, first_name: @participant.first_name, github: @participant.github, image_file: @participant.image_file, last_name: @participant.last_name, level: @participant.level, linkedin: @participant.linkedin, locked_at: @participant.locked_at, name: @participant.name, organizer_id: @participant.organizer_id, remember_created_at: @participant.remember_created_at, reset_password_sent_at: @participant.reset_password_sent_at, reset_password_token: @participant.reset_password_token, sash_id: @participant.sash_id, slug: @participant.slug, timezone: @participant.timezone, twitter: @participant.twitter, unconfirmed_email: @participant.unconfirmed_email, unlock_token: @participant.unlock_token, verification_date: @participant.verification_date, verified: @participant.verified, website: @participant.website } }
    assert_redirected_to participant_url(@participant)
  end

  test "should destroy participant" do
    assert_difference('Participant.count', -1) do
      delete participant_url(@participant)
    end

    assert_redirected_to participants_url
  end
end
