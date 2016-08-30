require "rails_helper"

feature "competitor submissions", js: true do
  let!(:participant) { create(:participant) }
  let!(:admin_participant) { create(:participant, :admin) }
  let!(:challenge) { create(:challenge, :with_milestones) }

  before (:example) do
    sign_in(participant)
  end

  scenario "a competitor must choose a framework" do
    visit challenge_path(challenge)
    click_link "Submit Entry"
    page.find('.btn-block', text: 'Submit Entry').click
    page.attach_file('predictionsFile', Rails.root + 'spec/support/files/test_csv_file.csv')
    page.attach_file('modelFile', Rails.root + 'spec/support/files/test_text_file.txt.zip')
    fill_in 'submission_description_markdown', with: 'Submission message'
    click_button 'Create Submission'
    expect(page).to have_text("can't be blank")
   end

  scenario "a competitor must provide a submission message" do
    visit challenge_path(challenge)
    click_link "Submit Entry"
    page.find('.btn-block', text: 'Submit Entry').click
    page.attach_file('predictionsFile', Rails.root + 'spec/support/files/test_csv_file.csv')
    page.attach_file('modelFile', Rails.root + 'spec/support/files/test_text_file.txt.zip')
    select 'Python-3 Scikit-Learn', from: 'Framework'
    click_button 'Create Submission'
    expect(page).to have_text("can't be blank")
  end

  scenario "submission notes are correctly marked up" do
    visit challenge_path(challenge)
    click_link "Submit Entry"
    page.find('.btn-block', text: 'Submit Entry').click
    page.attach_file('predictionsFile', Rails.root + 'spec/support/files/test_csv_file.csv')
    page.attach_file('modelFile', Rails.root + 'spec/support/files/test_text_file.txt.zip')
    select 'Python-3 Scikit-Learn', from: 'Framework'
    fill_in 'submission_description_markdown', with: '#Submission message'
    click_button 'Create Submission'
    expect(page).to have_text("Submission message")
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
