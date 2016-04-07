require "rails_helper"
require 'pp'

RSpec.feature "challenge", type: :feature do
  before do
    #@challenge = build(:challenge)
    @organizer = create(:organizer)
    @hosting_user = create(:user, organizer: @organizer)
    #pp @hosting_user
  end

  let(:organizer){ create :organizer }

  describe "challenge creation authority" do
    scenario "ordinary user cannot create a challenge" do
      let(:user){ create :user }

      visit organizer_path(:organizer)
      expect(page).to_not have_selector '.btn', text: '+ New Challenge'
    end

    scenario "user cannot create a challenge for a different organizer" do
      let(:user){ create :user }

      visit organizer_path(:organizer)
      expect(page).to_not have_selector '.btn', text: '+ New Challenge'
    end

    scenario "user associated with the organizer can create a challenge" do
      let(:user){ create :user }

      visit organizer_path(:organizer)
      expect(page).to have_selector '.btn', text: '+ New Challenge'
    end

    scenario "only organizers in active status can create a challenge" do
    end
  end


  describe "challenge status actions" do
    scenario "challenge can move from draft to running" do
    end

    scenario "challenge can move from running to cancelled" do
    end

    scenario "challenge can move from running to completed" do
    end

    scenario "a challenge can be deleted if it is in draft" do
    end

    scenario "challenge cannot move from draft to running without datasets present" do
    end
  end


  describe 'challenge CRUD actions' do
    scenario "any other user associated with the organizer can modify the challenge" do
    end

  end


  describe "running a challenge" do
    scenario "user can enter a running challenge" do
    end

    scenario "user can enter a running challenge twice" do
    end

    scenario "user can leave a running challenge" do
    end

    scenario "user cannot leave a completed challenge" do
    end

    scenario "user cannot leave a cancelled challenge" do
    end
  end

end
