require 'test_helper'

class ChallengesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @challenge = challenges(:one)
  end

  test "should get index" do
    get challenges_url
    assert_response :success
  end

  test "should get new" do
    get new_challenge_url
    assert_response :success
  end

  test "should create challenge" do
    assert_difference('Challenge.count') do
      post challenges_url, params: { challenge: { answer_file_s3_key: @challenge.answer_file_s3_key, api_required: @challenge.api_required, challenge: @challenge.challenge, challenge_client_name: @challenge.challenge_client_name, clef_challenge: @challenge.clef_challenge, clef_task_id: @challenge.clef_task_id, dataset_description: @challenge.dataset_description, dataset_description_markdown: @challenge.dataset_description_markdown, dataset_note: @challenge.dataset_note, dataset_note_markdown: @challenge.dataset_note_markdown, description: @challenge.description, description_markdown: @challenge.description_markdown, dynamic_content: @challenge.dynamic_content, dynamic_content_flag: @challenge.dynamic_content_flag, dynamic_content_tab: @challenge.dynamic_content_tab, evaluation: @challenge.evaluation, evaluation_markdown: @challenge.evaluation_markdown, featured_sequence: @challenge.featured_sequence, grader_identifier: @challenge.grader_identifier, grader_logs: @challenge.grader_logs, grading_history: @challenge.grading_history, image_file: @challenge.image_file, license: @challenge.license, license_markdown: @challenge.license_markdown, media_on_leaderboard: @challenge.media_on_leaderboard, online_grading: @challenge.online_grading, online_submissions: @challenge.online_submissions, organizer_id: @challenge.organizer_id, page_views: @challenge.page_views, participant_count: @challenge.participant_count, perpetual_challenge: @challenge.perpetual_challenge, post_challenge_submissions: @challenge.post_challenge_submissions, primary_sort_order_cd: @challenge.primary_sort_order_cd, private_challenge: @challenge.private_challenge, prizes: @challenge.prizes, prizes_markdown: @challenge.prizes_markdown, require_registration: @challenge.require_registration, resources: @challenge.resources, resources_markdown: @challenge.resources_markdown, rules: @challenge.rules, rules_markdown: @challenge.rules_markdown, score_secondary_title: @challenge.score_secondary_title, score_title: @challenge.score_title, secondary_sort_order_cd: @challenge.secondary_sort_order_cd, show_leaderboard: @challenge.show_leaderboard, slug: @challenge.slug, status_cd: @challenge.status_cd, submission_count: @challenge.submission_count, submission_instructions: @challenge.submission_instructions, submission_instructions_markdown: @challenge.submission_instructions_markdown, submission_license: @challenge.submission_license, submissions_downloadable: @challenge.submissions_downloadable, submissions_page: @challenge.submissions_page, tagline: @challenge.tagline, vote_count: @challenge.vote_count, winner_description: @challenge.winner_description, winner_description_markdown: @challenge.winner_description_markdown, winners_tab_active: @challenge.winners_tab_active } }
    end

    assert_redirected_to challenge_url(Challenge.last)
  end

  test "should show challenge" do
    get challenge_url(@challenge)
    assert_response :success
  end

  test "should get edit" do
    get edit_challenge_url(@challenge)
    assert_response :success
  end

  test "should update challenge" do
    patch challenge_url(@challenge), params: { challenge: { answer_file_s3_key: @challenge.answer_file_s3_key, api_required: @challenge.api_required, challenge: @challenge.challenge, challenge_client_name: @challenge.challenge_client_name, clef_challenge: @challenge.clef_challenge, clef_task_id: @challenge.clef_task_id, dataset_description: @challenge.dataset_description, dataset_description_markdown: @challenge.dataset_description_markdown, dataset_note: @challenge.dataset_note, dataset_note_markdown: @challenge.dataset_note_markdown, description: @challenge.description, description_markdown: @challenge.description_markdown, dynamic_content: @challenge.dynamic_content, dynamic_content_flag: @challenge.dynamic_content_flag, dynamic_content_tab: @challenge.dynamic_content_tab, evaluation: @challenge.evaluation, evaluation_markdown: @challenge.evaluation_markdown, featured_sequence: @challenge.featured_sequence, grader_identifier: @challenge.grader_identifier, grader_logs: @challenge.grader_logs, grading_history: @challenge.grading_history, image_file: @challenge.image_file, license: @challenge.license, license_markdown: @challenge.license_markdown, media_on_leaderboard: @challenge.media_on_leaderboard, online_grading: @challenge.online_grading, online_submissions: @challenge.online_submissions, organizer_id: @challenge.organizer_id, page_views: @challenge.page_views, participant_count: @challenge.participant_count, perpetual_challenge: @challenge.perpetual_challenge, post_challenge_submissions: @challenge.post_challenge_submissions, primary_sort_order_cd: @challenge.primary_sort_order_cd, private_challenge: @challenge.private_challenge, prizes: @challenge.prizes, prizes_markdown: @challenge.prizes_markdown, require_registration: @challenge.require_registration, resources: @challenge.resources, resources_markdown: @challenge.resources_markdown, rules: @challenge.rules, rules_markdown: @challenge.rules_markdown, score_secondary_title: @challenge.score_secondary_title, score_title: @challenge.score_title, secondary_sort_order_cd: @challenge.secondary_sort_order_cd, show_leaderboard: @challenge.show_leaderboard, slug: @challenge.slug, status_cd: @challenge.status_cd, submission_count: @challenge.submission_count, submission_instructions: @challenge.submission_instructions, submission_instructions_markdown: @challenge.submission_instructions_markdown, submission_license: @challenge.submission_license, submissions_downloadable: @challenge.submissions_downloadable, submissions_page: @challenge.submissions_page, tagline: @challenge.tagline, vote_count: @challenge.vote_count, winner_description: @challenge.winner_description, winner_description_markdown: @challenge.winner_description_markdown, winners_tab_active: @challenge.winners_tab_active } }
    assert_redirected_to challenge_url(@challenge)
  end

  test "should destroy challenge" do
    assert_difference('Challenge.count', -1) do
      delete challenge_url(@challenge)
    end

    assert_redirected_to challenges_url
  end
end
