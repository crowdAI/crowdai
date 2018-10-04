require 'test_helper'

class ParticipantChallengesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participant_challenge = participant_challenges(:one)
  end

  test "should get index" do
    get participant_challenges_url
    assert_response :success
  end

  test "should get new" do
    get new_participant_challenge_url
    assert_response :success
  end

  test "should create participant_challenge" do
    assert_difference('ParticipantChallenge.count') do
      post participant_challenges_url, params: { participant_challenge: { bio: @participant_challenge.bio, challenge: @participant_challenge.challenge, challenge_id: @participant_challenge.challenge_id, description: @participant_challenge.description, email: @participant_challenge.email, github: @participant_challenge.github, image_file: @participant_challenge.image_file, linkedin: @participant_challenge.linkedin, name: @participant_challenge.name, organizer_id: @participant_challenge.organizer_id, page_views: @participant_challenge.page_views, participant_count: @participant_challenge.participant_count, participant_id: @participant_challenge.participant_id, private_challenge: @participant_challenge.private_challenge, prizes: @participant_challenge.prizes, resources: @participant_challenge.resources, rules: @participant_challenge.rules, status_cd: @participant_challenge.status_cd, submission_count: @participant_challenge.submission_count, tagline: @participant_challenge.tagline, twitter: @participant_challenge.twitter } }
    end

    assert_redirected_to participant_challenge_url(ParticipantChallenge.last)
  end

  test "should show participant_challenge" do
    get participant_challenge_url(@participant_challenge)
    assert_response :success
  end

  test "should get edit" do
    get edit_participant_challenge_url(@participant_challenge)
    assert_response :success
  end

  test "should update participant_challenge" do
    patch participant_challenge_url(@participant_challenge), params: { participant_challenge: { bio: @participant_challenge.bio, challenge: @participant_challenge.challenge, challenge_id: @participant_challenge.challenge_id, description: @participant_challenge.description, email: @participant_challenge.email, github: @participant_challenge.github, image_file: @participant_challenge.image_file, linkedin: @participant_challenge.linkedin, name: @participant_challenge.name, organizer_id: @participant_challenge.organizer_id, page_views: @participant_challenge.page_views, participant_count: @participant_challenge.participant_count, participant_id: @participant_challenge.participant_id, private_challenge: @participant_challenge.private_challenge, prizes: @participant_challenge.prizes, resources: @participant_challenge.resources, rules: @participant_challenge.rules, status_cd: @participant_challenge.status_cd, submission_count: @participant_challenge.submission_count, tagline: @participant_challenge.tagline, twitter: @participant_challenge.twitter } }
    assert_redirected_to participant_challenge_url(@participant_challenge)
  end

  test "should destroy participant_challenge" do
    assert_difference('ParticipantChallenge.count', -1) do
      delete participant_challenge_url(@participant_challenge)
    end

    assert_redirected_to participant_challenges_url
  end
end
