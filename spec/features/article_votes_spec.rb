require 'rails_helper'

feature 'Article voting', js: true do
  let!(:participant) { create :participant }
  let!(:other_participant) { create :participant }
  let!(:another_participant) { create :participant }
  let!(:article) { create :article, :with_sections, participant_id: other_participant.id }

  describe 'view article with votes' do
    scenario "guest user" do
      visit '/'
      click_link article.article
      page.find(:xpath, './/a[@href=" 0"]')


      #within("#vote-#{article.id}") do
      #  find( 'a', text: '2', exact: true )
      #end
    end
  end
end
