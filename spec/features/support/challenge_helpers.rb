module ChallengeHelpers

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
    attach_file('challenge_answer_file_s3_key', Rails.root + 'spec/support/files/test_csv_file.csv')

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

    find('#submission-instructions-tab').click
    find('#challenge_submission_instructions_markdown').set(challenge_data.submission_instructions_markdown)
  end


  def enter_challenge_with_timeline(challenge_data)
    enter_challenge_without_timeline(challenge_data)

    find('#timeline-tab').click
    click_link 'Add Milestone'
    fill_in 'Seq',          with: '0'
    fill_in 'Event',        with: 'Start of event'
    fill_in 'Event time',   with: '24/08/2016 08:01'


    click_link 'Add Milestone'
    seq_fields = page.all('input[id^="challenge_events_attributes_"][id$="_seq"]')
    seq_fields[1].set('1')

    event_fields = page.all('input[id^="challenge_events_attributes_"][id$="_event"]')
    event_fields[1].set('End of event')

    date_fields = page.all('input[id^="challenge_events_attributes_"][id$="_event_time"]')
    date_fields[1].set('24/10/2016 17:00')
  end


  def create_perpetual_challenge(challenge_data)
    enter_challenge_without_timeline(challenge_data)
    toggle_perpetual_challenge
  end

  def toggle_perpetual_challenge
    find('#timeline-tab').click
    check('Perpetual challenge')
    click_button 'Create Challenge'
  end

  def add_dataset_file
    find('#glyphicon-link-dataset').click
    click_link 'Add file'
    fill_in 'Seq', with: '0'
    fill_in 'Description', with: "test file"
    attach_file('Dataset file s3 key', Rails.root + 'spec/support/files/test_csv_file.csv')
    click_button 'Create File'
  end

end
