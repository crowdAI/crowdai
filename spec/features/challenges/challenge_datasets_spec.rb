require 'rails_helper'

feature "download dataset links" do
  let!(:participant) { create(:participant, :admin) }
  let!(:challenge) { create :challenge }
  let!(:participant) { create :participant }
  let!(:admin) { create :participant, :admin }
  let!(:organizer) { create :participant, organizer: challenge.organizer }

  context 'download link' do
    scenario 'participant' do
      log_in(participant)
      visit challenge_dataset_files_path(challenge)
      expect(page).not_to have_link 'delete'
    end
    scenario 'admin' do
      log_in(admin)
      visit challenge_dataset_files_path(challenge)
      expect(page).to have_link 'delete'
    end
    scenario 'organizer' do
      log_in(organizer)
      visit challenge_dataset_files_path(challenge)
      expect(page).to have_link 'delete'
    end
  end

  #context 'download count' do
  #  scenario 'participant' do
  #    log_in(participant)
  #    visit challenge_dataset_files_path(challenge)
      #click_link 'first_file'
      #expect(DatasetFileDownload.count).to eq(1)
  #  end
  #end
end
