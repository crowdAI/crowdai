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
      fill_in 'Seq',          with: '1'
      fill_in 'Event',        with: 'End of event'

      click_button 'Create Challenge'
      expect(page).to have_content "Challenge was successfully created."
    end


    scenario 'edit challenge after creation' do
      create_perpetual_challenge(challenge_data)
      click_link 'Edit'
      expect(page).to have_content 'Editing Challenge'
    end


    scenario 'create challenge with dataset' do
      skip("spec to be coded")
    end

  end


end


=begin

RSpec.feature "challenge", type: :feature do
  before(:each) do
    @participant = create :participant
    @admin_participant = create :participant, :admin
    @organizer =  create :organizer
    @second_organizer = create :organizer, :second_organizer
    @organizer_participant = create :participant, organizer_id: @organizer.id
    @draft_challenge = create :challenge
    @running_challenge = create :challenge, :running
    @login_page = DeviseSessionsNew.new
  end

  describe "grading parameters" do
    scenario "challenge admin must choose primary grading method and sort"
      skip("spec to be coded")
    end

    scenario "challenge admin can choose secondary grading method and sort"
      skip("spec to be coded")
    end

    scenario "challenge admin can choose percentage for grading method"
      skip("spec to be coded")
    end

    scenario "challenge admin can modify percentage for grading method"
      skip("spec to be coded")
    end
  end

end
=end
