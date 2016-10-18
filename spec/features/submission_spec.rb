require "rails_helper"

feature "competitor submissions for python grading", js: true do
  let!(:participant) { create(:participant) }
  let!(:admin_participant) { create(:participant, :admin) }
  let!(:challenge) { create(:challenge, :with_milestones) }

  before (:example) do
    sign_in(participant)
    access_submission(challenge)
  end

  scenario "a python-graded challenge does not show the docker select box" do
    expect(page).to have_text("Will be graded by #{challenge.grader}")
    expect(page).not_to have_text "Docker configuration"
  end


  scenario "a participant can submit to the challenge" do
    page.attach_file('File 1', Rails.root + 'spec/support/files/test_csv_file.csv')
    fill_in 'submission_description_markdown', with: 'Submission message'
    click_button 'Create Submission'
    expect(page).to have_text("Submission accepted.")
   end


  scenario "a competitor must provide a submission message" do
    page.attach_file('File 1', Rails.root + 'spec/support/files/test_csv_file.csv')
    click_button 'Create Submission'
    expect(page).to have_text("can't be blank")
  end



end

feature "competitor submissions for docker grading", js: true do
  let!(:participant) { create(:participant) }
  let!(:admin_participant) { create(:participant, :admin) }
  let!(:challenge) { create(:challenge, :with_milestones, grader: :docker_container) }

  before (:example) do
    sign_in(participant)
    access_submission(challenge)
  end

  scenario "a docker-graded challenge requries selecting the docker file" do
    expect(page).not_to have_text("Will be graded by #{challenge.grader}")
    expect(page).to have_text "Docker configuration"
  end

end
