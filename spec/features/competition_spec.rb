require "rails_helper"
require 'pp'

RSpec.feature "competition", type: :feature do
  before do
    #@competition = build(:competition)
    @hosting_institution = create(:hosting_institution)
    @hosting_user = create(:user, hosting_institution: @hosting_institution)
    pp @hosting_user
  end

  let(:hosting_institution){ create :hosting_institution }

  describe "competition creation authority" do
    scenario "ordinary user cannot create a competition" do
      let(:user){ create :user }

      visit hosting_institution_path(:hosting_institution)
      expect(page).to_not have_selector '.btn', text: '+ New Competition'
    end

    scenario "user cannot create a competition for a different hosting institution" do
      let(:user){ create :user }

      visit hosting_institution_path(:hosting_institution)
      expect(page).to_not have_selector '.btn', text: '+ New Competition'
    end

    scenario "user associated with the hosting institution can create a competition" do
      let(:user){ create :user }

      visit hosting_institution_path(:hosting_institution)
      expect(page).to have_selector '.btn', text: '+ New Competition'
    end

    scenario "only hosting institutions in active status can create a competition" do
    end
  end


  describe "competition status actions" do
    scenario "competition can move from draft to running" do
    end

    scenario "competition can move from running to cancelled" do
    end

    scenario "competition can move from running to completed" do
    end

    scenario "a competition can be deleted if it is in draft" do
    end

    scenario "competition cannot move from draft to running without datasets present" do
    end
  end


  describe 'competition CRUD actions' do
    scenario "any other user associated with the hosting institution can modify the competition" do
    end

  end


  describe "running a competition" do
    scenario "user can enter a running competition" do
    end

    scenario "user can enter a running competition twice" do
    end

    scenario "user can leave a running competition" do
    end

    scenario "user cannot leave a completed competition" do
    end

    scenario "user cannot leave a cancelled competition" do
    end
  end

end
