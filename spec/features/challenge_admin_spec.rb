require "rails_helper"

feature 'Challenge CRUD for admin user', js: true do

  let!(:admin) { create(:participant, :admin) }
  let!(:organizer) { create(:organizer) }
  let!(:challenge_data) { build(:challenge) }

  describe "create new challenge page" do
    before(:example) do
      #visit_organizer(admin,organizer)  TODO
      visit_landing_page(admin  )
      visit organizer_path(organizer)
      click_link '+ New Challenge'
    end

    scenario 'create perpetual challenge' do
      create_perpetual_challenge(challenge_data)
      expect(page).to have_content "Challenge was successfully created."
    end

    scenario 'create challenge with start and finish dates' do
      enter_challenge_without_timeline(challenge_data)

      find('#timeline-tab').click
      click_link 'Add Milestone'
      fill_in 'Seq',          with: '0'
      fill_in 'Event',        with: 'Start of event'

      click_link 'Add Milestone'
      seq_fields = page.all('input[id^="challenge_events_attributes_"][id$="_seq"]')
      seq_fields[1].set('1')

      event_fields = page.all('input[id^="challenge_events_attributes_"][id$="_event"]')
      event_fields[1].set('End of event')
      #sleep(5)

      click_button 'Create Challenge'
      expect(page).to have_content "Challenge was successfully created."
    end

    scenario 'edit challenge after creation' do
      create_perpetual_challenge(challenge_data)
      click_link 'Edit'
      expect(page).to have_button 'Update Challenge'
    end

    scenario 'create challenge with dataset' do
      create_perpetual_challenge(challenge_data)
      click_link 'Dataset'
      click_link 'Add file'
      fill_in 'Seq',                with: '1'
      fill_in 'Description',        with: 'Test Filename'
      #find('#dataset_file_dataset_file_s3_key').click
      attach_file('dataset_file_dataset_file_s3_key', Rails.root + 'spec/support/files/test_text_file.txt')
      expect(page).not_to have_content "failed"
      click_button "Create File"  # TODO
    end

    scenario "challenge admin must configer a grading method" do
      click_link 'Evaluation'
      fill_in 'Grader',                 with: 'F1 logloss'
      fill_in 'Grading factor',         with: '0.3'
      fill_in 'Answer file s3 key',     with: 'answer_files/plant_village_answers.csv'
      fill_in 'Primary score title',    with: 'Mean F1'
      fill_in 'Secondary score title',  with: 'Mean Log loss'
      click_button 'Update Challenge'
      expect(page).to have_content "Challenge was successfully updated."
    end
  end


  describe "validate challenge statuses" do
    before(:example) do
      visit_landing_page(admin  )
      visit organizer_path(organizer)
      click_link '+ New Challenge'
      enter_challenge_with_timeline(challenge_data)
    end

    scenario "challenge cannot move from draft to running without datasets present" do
      click_link 'Overview'
      select 'Running', from: 'Status'
      click_button 'Create Challenge'
      expect(page).to have_content "Challenge cannot start until dataset files are added."
    end

    scenario "challenge can be saved in draft to running without datasets present" do
      click_link 'Overview'
      select 'Draft', from: 'Status'
      click_button 'Create Challenge'
      expect(page).to have_content "Challenge was successfully updated."
    end

    scenario "a draft challenge can have datasets added" do
      click_link 'Dataset'
      select 'Running', from: 'Status'
      click_button 'Create Challenge'
      expect(page).to have_content "Challenge cannot start until dataset files are added."
    end

    scenario "challenge can move from running to cancelled" do
      click_link 'Overview'
      select 'Cancelled', from: 'Status'
      click_button 'Update Challenge'
      expect(page).to have_content "Challenge was successfully updated."
    end

    scenario "challenge can move from running to completed" do
      click_link 'Overview'
      select 'Completed', from: 'Status'
      click_button 'Update Challenge'
      expect(page).to have_content "Challenge was successfully updated."
    end


    if self.status == 'running'
      if self.dataset_files.none?
        errors.add("Challenge cannot start until dataset files are added.")
      end
    end
    if self.status == 'cancelled' and self.status_was != 'running'
      errors.add("Only a running challenge may be cancelled.")
    end

  end
end
