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
    select 'F1 logloss',              from: 'Grader'
    fill_in 'Grading factor',         with: '0.3'
    fill_in 'Answer file s3 key',     with: 'test_file.csv'
    fill_in 'Primary score title',    with: 'Mean F1'
    find('#challenge_primary_sort_order').set('Ascending')
    fill_in 'Secondary score title',  with: 'Mean Log loss'
    find('#challenge_secondary_sort_order').set('Descending')
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


  def enter_challenge_with_timeline(challenge_data)
    find('#overview-tab').click
    fill_in 'Challenge',          with: challenge_data.challenge
    fill_in 'Tagline',            with: challenge_data.tagline
    #select organizer.organizer,   from: 'Organizer'
    select 'Draft',               from: 'Status'
    find('#challenge_description_markdown').set(challenge_data.description_markdown)

    find('#evaluation-tab').click
    select 'F1 logloss',              from: 'Grader'
    fill_in 'Grading factor',         with: '0.3'
    fill_in 'Answer file s3 key',     with: 'test_file.csv'
    fill_in 'Primary score title',    with: 'Mean F1'
    find('#challenge_primary_sort_order').set('Ascending')
    fill_in 'Secondary score title',  with: 'Mean Log loss'
    find('#challenge_secondary_sort_order').set('Descending')
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

    find('#timeline-tab').click
    click_link 'Add Milestone'
    fill_in 'Seq',          with: '0'
    fill_in 'Event',        with: 'Start of event'

    click_link 'Add Milestone'
    seq_fields = page.all('input[id^="challenge_events_attributes_"][id$="_seq"]')
    seq_fields[1].set('1')

    event_fields = page.all('input[id^="challenge_events_attributes_"][id$="_event"]')
    event_fields[1].set('End of event')
  end


  def create_perpetual_challenge(challenge_data)
    enter_challenge_without_timeline(challenge_data)
    find('#timeline-tab').click
    check('Perpetual challenge')
    click_button 'Create Challenge'
  end

end
