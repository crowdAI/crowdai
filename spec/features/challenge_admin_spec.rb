require "rails_helper"

feature 'Challenge CRUD for admin user', js: true do
  let!(:admin) { create(:participant, :admin) }
  let!(:organizer) { create(:organizer) }
  let!(:challenge_data) { build(:challenge) }

  describe "create new challenge page" do
    before(:example) do
      visit_organizer(admin,organizer)
      click_link '+ New Challenge'
    end

    scenario 'Overview page' do
      click_link 'Overview'
      fill_in 'Challenge',          with: challenge_data.challenge
      fill_in 'Tagline',            with: challenge_data.tagline
      select organizer.organizer,   from: 'Organizer'
      select 'Draft',               from: 'Status'
      click_button 'Create Challenge'
      expect(page)
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
