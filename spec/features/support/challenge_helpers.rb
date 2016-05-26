module ChallengeHelpers

  def visit_organizers_index(participant)
    visit_landing_page(participant)
    click_link 'Organizers'
  end

  def visit_organizer(participant,organizer)
    visit_landing_page(admin)
    click_link 'Organizers'
    click_link organizer.organizer
  end


  def enter_challenge_without_timeline(challenge_data)
    find('#overview-tab').click
    fill_in 'Challenge',          with: challenge_data.challenge
    fill_in 'Tagline',            with: challenge_data.tagline
    #select organizer.organizer,   from: 'Organizer'
    select 'Draft',               from: 'Status'
    find('#challenge_description_markdown').set(challenge_data.description_markdown)

    find('#evaluation-tab').click
    select 'Ascending',           from: 'Score sort'
    select 'Not used',            from: 'Score secondary sort'
    find('#challenge_evaluation_markdown').set(challenge_data.evaluation_markdown)

    find('#rules-tab').click
    find('#challenge_rules_markdown').set(challenge_data.rules_markdown)

    find('#prizes-tab').click
    find('#challenge_prizes_markdown').set(challenge_data.prizes_markdown)

    find('#resources-tab').click
    find('#challenge_resources_markdown').set(challenge_data.resources_markdown)

    find('#timeline-tab').click
    check('Perpetual challenge')

    find('#submission-instructions-tab').click
    find('#challenge_submission_instructions_markdown').set(challenge_data.submission_instructions_markdown)
  end


  def create_perpetual_challenge(challenge_data)
    enter_challenge_without_timeline(challenge_data)
    find('#timeline-tab').click
    check('Perpetual challenge')
    click_button 'Create Challenge'
  end

end
