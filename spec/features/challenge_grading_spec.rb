require "rails_helper"
require 'pp'
require 'views/devise/devise_sessions_new'
require 'views/landing_page'


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
