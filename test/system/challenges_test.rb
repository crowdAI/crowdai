require "application_system_test_case"

class ChallengesTest < ApplicationSystemTestCase
  setup do
    @challenge = challenges(:one)
  end

  test "visiting the index" do
    visit challenges_url
    assert_selector "h1", text: "Challenges"
  end

  test "creating a Challenge" do
    visit challenges_url
    click_on "New Challenge"

    fill_in "Answer File S3 Key", with: @challenge.answer_file_s3_key
    fill_in "Api Required", with: @challenge.api_required
    fill_in "Challenge", with: @challenge.challenge
    fill_in "Challenge Client Name", with: @challenge.challenge_client_name
    fill_in "Clef Challenge", with: @challenge.clef_challenge
    fill_in "Clef Task", with: @challenge.clef_task_id
    fill_in "Dataset Description", with: @challenge.dataset_description
    fill_in "Dataset Description Markdown", with: @challenge.dataset_description_markdown
    fill_in "Dataset Note", with: @challenge.dataset_note
    fill_in "Dataset Note Markdown", with: @challenge.dataset_note_markdown
    fill_in "Description", with: @challenge.description
    fill_in "Description Markdown", with: @challenge.description_markdown
    fill_in "Dynamic Content", with: @challenge.dynamic_content
    fill_in "Dynamic Content Flag", with: @challenge.dynamic_content_flag
    fill_in "Dynamic Content Tab", with: @challenge.dynamic_content_tab
    fill_in "Evaluation", with: @challenge.evaluation
    fill_in "Evaluation Markdown", with: @challenge.evaluation_markdown
    fill_in "Featured Sequence", with: @challenge.featured_sequence
    fill_in "Grader Identifier", with: @challenge.grader_identifier
    fill_in "Grader Logs", with: @challenge.grader_logs
    fill_in "Grading History", with: @challenge.grading_history
    fill_in "Image File", with: @challenge.image_file
    fill_in "License", with: @challenge.license
    fill_in "License Markdown", with: @challenge.license_markdown
    fill_in "Media On Leaderboard", with: @challenge.media_on_leaderboard
    fill_in "Online Grading", with: @challenge.online_grading
    fill_in "Online Submissions", with: @challenge.online_submissions
    fill_in "Organizer", with: @challenge.organizer_id
    fill_in "Page Views", with: @challenge.page_views
    fill_in "Participant Count", with: @challenge.participant_count
    fill_in "Perpetual Challenge", with: @challenge.perpetual_challenge
    fill_in "Post Challenge Submissions", with: @challenge.post_challenge_submissions
    fill_in "Primary Sort Order Cd", with: @challenge.primary_sort_order_cd
    fill_in "Private Challenge", with: @challenge.private_challenge
    fill_in "Prizes", with: @challenge.prizes
    fill_in "Prizes Markdown", with: @challenge.prizes_markdown
    fill_in "Require Registration", with: @challenge.require_registration
    fill_in "Resources", with: @challenge.resources
    fill_in "Resources Markdown", with: @challenge.resources_markdown
    fill_in "Rules", with: @challenge.rules
    fill_in "Rules Markdown", with: @challenge.rules_markdown
    fill_in "Score Secondary Title", with: @challenge.score_secondary_title
    fill_in "Score Title", with: @challenge.score_title
    fill_in "Secondary Sort Order Cd", with: @challenge.secondary_sort_order_cd
    fill_in "Show Leaderboard", with: @challenge.show_leaderboard
    fill_in "Slug", with: @challenge.slug
    fill_in "Status Cd", with: @challenge.status_cd
    fill_in "Submission Count", with: @challenge.submission_count
    fill_in "Submission Instructions", with: @challenge.submission_instructions
    fill_in "Submission Instructions Markdown", with: @challenge.submission_instructions_markdown
    fill_in "Submission License", with: @challenge.submission_license
    fill_in "Submissions Downloadable", with: @challenge.submissions_downloadable
    fill_in "Submissions Page", with: @challenge.submissions_page
    fill_in "Tagline", with: @challenge.tagline
    fill_in "Vote Count", with: @challenge.vote_count
    fill_in "Winner Description", with: @challenge.winner_description
    fill_in "Winner Description Markdown", with: @challenge.winner_description_markdown
    fill_in "Winners Tab Active", with: @challenge.winners_tab_active
    click_on "Create Challenge"

    assert_text "Challenge was successfully created"
    click_on "Back"
  end

  test "updating a Challenge" do
    visit challenges_url
    click_on "Edit", match: :first

    fill_in "Answer File S3 Key", with: @challenge.answer_file_s3_key
    fill_in "Api Required", with: @challenge.api_required
    fill_in "Challenge", with: @challenge.challenge
    fill_in "Challenge Client Name", with: @challenge.challenge_client_name
    fill_in "Clef Challenge", with: @challenge.clef_challenge
    fill_in "Clef Task", with: @challenge.clef_task_id
    fill_in "Dataset Description", with: @challenge.dataset_description
    fill_in "Dataset Description Markdown", with: @challenge.dataset_description_markdown
    fill_in "Dataset Note", with: @challenge.dataset_note
    fill_in "Dataset Note Markdown", with: @challenge.dataset_note_markdown
    fill_in "Description", with: @challenge.description
    fill_in "Description Markdown", with: @challenge.description_markdown
    fill_in "Dynamic Content", with: @challenge.dynamic_content
    fill_in "Dynamic Content Flag", with: @challenge.dynamic_content_flag
    fill_in "Dynamic Content Tab", with: @challenge.dynamic_content_tab
    fill_in "Evaluation", with: @challenge.evaluation
    fill_in "Evaluation Markdown", with: @challenge.evaluation_markdown
    fill_in "Featured Sequence", with: @challenge.featured_sequence
    fill_in "Grader Identifier", with: @challenge.grader_identifier
    fill_in "Grader Logs", with: @challenge.grader_logs
    fill_in "Grading History", with: @challenge.grading_history
    fill_in "Image File", with: @challenge.image_file
    fill_in "License", with: @challenge.license
    fill_in "License Markdown", with: @challenge.license_markdown
    fill_in "Media On Leaderboard", with: @challenge.media_on_leaderboard
    fill_in "Online Grading", with: @challenge.online_grading
    fill_in "Online Submissions", with: @challenge.online_submissions
    fill_in "Organizer", with: @challenge.organizer_id
    fill_in "Page Views", with: @challenge.page_views
    fill_in "Participant Count", with: @challenge.participant_count
    fill_in "Perpetual Challenge", with: @challenge.perpetual_challenge
    fill_in "Post Challenge Submissions", with: @challenge.post_challenge_submissions
    fill_in "Primary Sort Order Cd", with: @challenge.primary_sort_order_cd
    fill_in "Private Challenge", with: @challenge.private_challenge
    fill_in "Prizes", with: @challenge.prizes
    fill_in "Prizes Markdown", with: @challenge.prizes_markdown
    fill_in "Require Registration", with: @challenge.require_registration
    fill_in "Resources", with: @challenge.resources
    fill_in "Resources Markdown", with: @challenge.resources_markdown
    fill_in "Rules", with: @challenge.rules
    fill_in "Rules Markdown", with: @challenge.rules_markdown
    fill_in "Score Secondary Title", with: @challenge.score_secondary_title
    fill_in "Score Title", with: @challenge.score_title
    fill_in "Secondary Sort Order Cd", with: @challenge.secondary_sort_order_cd
    fill_in "Show Leaderboard", with: @challenge.show_leaderboard
    fill_in "Slug", with: @challenge.slug
    fill_in "Status Cd", with: @challenge.status_cd
    fill_in "Submission Count", with: @challenge.submission_count
    fill_in "Submission Instructions", with: @challenge.submission_instructions
    fill_in "Submission Instructions Markdown", with: @challenge.submission_instructions_markdown
    fill_in "Submission License", with: @challenge.submission_license
    fill_in "Submissions Downloadable", with: @challenge.submissions_downloadable
    fill_in "Submissions Page", with: @challenge.submissions_page
    fill_in "Tagline", with: @challenge.tagline
    fill_in "Vote Count", with: @challenge.vote_count
    fill_in "Winner Description", with: @challenge.winner_description
    fill_in "Winner Description Markdown", with: @challenge.winner_description_markdown
    fill_in "Winners Tab Active", with: @challenge.winners_tab_active
    click_on "Update Challenge"

    assert_text "Challenge was successfully updated"
    click_on "Back"
  end

  test "destroying a Challenge" do
    visit challenges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Challenge was successfully destroyed"
  end
end
