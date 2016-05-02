require "rails_helper"
require 'pp'

RSpec.feature "challenge", type: :feature do
  #before do
    #@challenge = build(:challenge)
    #@organizer = create(:organizer)
    #@hosting_participant = create(:participant, organizer: @organizer)
    #pp @hosting_participant
  #end

  let(:organizer){ create :organizer }

  describe "challenge creation authority" do
    let(:participant) { create :participant }

    scenario "ordinary participant cannot create a challenge" do
      visit organizer_path(:organizer)
      expect(page).to_not have_selector '.btn', text: '+ New Challenge'
    end

    scenario "participant cannot create a challenge for a different organizer" do
      participant_organizer = FactoryGirl.create(:organizer)
      visit organizer_path(:organizer)
      participant.update!(organizer_id: participant_organizer.id)
      expect(page).to_not have_selector '.btn', text: '+ New Challenge'
    end

    scenario "participant associated with the organizer can create a challenge" do
      participant.update!(organizer_id: organizer.id)
      visit organizer_path(:organizer)
      expect(page).to have_selector '.btn', text: '+ New Challenge'
    end

    scenario "only organizers in active status can create a challenge" do
    end
  end


  describe "challenge status actions" do
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


  describe 'challenge CRUD actions' do
    scenario "any other participant associated with the organizer can modify the challenge" do
      skip("spec to be coded")
    end

  end

  describe "viewing challenge information" do
    scenario "participant cannot see a challenge while it is in draft" do
      skip("spec to be coded")
    end
  end

end
