require "rails_helper"
require 'views/devise/devise_sessions_new'


RSpec.feature "submissions", type: :feature do
  before(:each) do
    @participant = create :participant
    @admin_participant = create :participant, :admin
    @challenge = create :challenge, :with_events
    @login_page = DeviseSessionsNew.new.visit_page.login(@participant)
  end

  describe "competitor submissions" do

    scenario "a competitor must choose a framework" do
      visit challenge_path(@challenge)
      click_link "Submit Entry"
      page.find('.btn-block', text: 'Submit Entry').click
      page.attach_file('predictionsFile', Rails.root + 'spec/support/files/test_csv_file.csv')
      page.attach_file('modelFile', Rails.root + 'spec/support/files/test_text_file.txt.zip')
      fill_in 'markdown_textarea', with: 'Submission message'
      click_button 'Create Submission'
      expect(page).to have_text("can't be blank")
    end

    scenario "a competitor must provide a submission message" do
      visit challenge_path(@challenge)
      click_link "Submit Entry"
      page.find('.btn-block', text: 'Submit Entry').click
      page.attach_file('predictionsFile', Rails.root + 'spec/support/files/test_csv_file.csv')
      page.attach_file('modelFile', Rails.root + 'spec/support/files/test_text_file.txt.zip')
      select 'Python-3 Scikit-Learn', from: 'Framework'
      click_button 'Create Submission'
      expect(page).to have_text("can't be blank")
    end


    scenario "a competitor must provide be a .csv file as file 1" do
      skip("spec to be coded")
    end

    scenario "a competitor must provide be an archive as file 2" do
      skip("spec to be coded")
    end

    scenario "a participant cannot access another participants entry" do
      skip("spec to be coded")
    end

    scenario "a competitor may not make more then 5 submissions in a day" do
      skip("spec to be coded")
    end
  end


end
