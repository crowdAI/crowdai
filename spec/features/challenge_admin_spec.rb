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

      scenario "challenge admin must choose primary grading method and sort" do
        skip("spec to be coded")
      end

      scenario "challenge admin can choose secondary grading method and sort" do
        skip("spec to be coded")
      end

      scenario "challenge admin can choose percentage for grading method" do
        skip("spec to be coded")
      end

      scenario "challenge admin can modify percentage for grading method" do
        skip("spec to be coded")
      end

        scenario "challenge can move from draft to running" do
          skip("spec to be coded")
        end

        scenario "challenge can move from running to cancelled" do
          skip("spec to be coded")
        end

        scenario "challenge can move from running to completed" do
          skip("spec to be coded")
        end

        scenario "a challenge can be deleted if it is in draft" do
          skip("spec to be coded")
        end

        scenario "challenge cannot move from draft to running without datasets present" do
          skip("spec to be coded")
        end
      

  end
end
