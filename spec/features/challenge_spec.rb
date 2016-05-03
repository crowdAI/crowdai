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

  describe "CRUD authority" do
    scenario "ordinary participant cannot create, edit or delete a challenge" do
      @login_page.visit_page.login(@participant)
      visit organizer_path(@organizer)
      expect(page).to have_content(@organizer.organizer)
      expect(page).to_not have_selector '.btn', text: '+ New Challenge'
      expect(page).to_not have_selector '.btn', text: 'Edit Challenge'
      expect(page).to_not have_selector '.btn', text: 'Delete Organizer'
    end

    scenario "participant associated with an approved organizer can create or edit a challenge" do
      @login_page.visit_page.login(@organizer_participant)
      visit organizer_path(@organizer)
      expect(page).to have_content(@organizer.organizer)
      expect(page).to have_selector '.btn', text: '+ New Challenge'
      expect(page).to have_selector '.btn', text: 'Edit Challenge'
      expect(page).to_not have_selector '.btn', text: 'Delete Organizer'
    end

    scenario "participant cannot create a challenge for a different organizer" do
      @login_page.visit_page.login(@participant)
      visit organizer_path(@second_organizer)
      expect(page).to have_content(@second_organizer.organizer)
      expect(page).to_not have_selector '.btn', text: '+ New Challenge'
      expect(page).to_not have_selector '.btn', text: 'Edit Challenge'
      expect(page).to_not have_selector '.btn', text: 'Delete Organizer'
    end

    scenario "only approved organizers can create a challenge" do
      @organizer.approved = false
      @login_page.visit_page.login(@organizer_participant)
      visit organizer_path(@organizer)
      expect(page).to have_selector '.btn', text: '+ New Challenge'
      expect(page).to have_selector '.btn', text: 'Edit Challenge'
      expect(page).to_not have_selector '.btn', text: 'Delete Organizer'
    end

    scenario "admins can perform all CRUD actions" do
      @login_page.visit_page.login(@admin_participant)
      visit organizer_path(@organizer)
      expect(page).to have_selector '.btn', text: '+ New Challenge'
      expect(page).to have_selector '.btn', text: 'Edit Challenge'
      expect(page).to have_selector '.btn', text: 'Delete Organizer'
    end

    scenario "participant cannot see a draft challenge" do
      @login_page.visit_page.login(@participant)
      LandingPage.new.index
      expect(page).to have_content(@running_challenge.challenge)
      expect(page).to_not have_content(@draft_challenge.challenge)
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


end
