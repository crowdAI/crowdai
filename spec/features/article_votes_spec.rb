require 'rails_helper'

feature 'Article voting', js: true do
  let!(:participant) { create :participant }
  let!(:other_participant) { create :participant }
  let!(:another_participant) { create :participant }
  let!(:article) { create :article, :with_sections, participant_id: other_participant.id }
  let!(:voted_article) { create :article, :with_sections_and_votes, participant_id: other_participant.id }

  describe 'guest user' do
    scenario "view article with no votes" do
      visit '/'
      click_link article.article

      within "a#vote-link-#{article.id}" do
        page.should have_content '0'
      end
    end

    scenario "view article with 1 vote" do
      visit '/'
      click_link voted_article.article

      within "a#vote-link-#{voted_article.id}" do
        page.should have_content '1'
      end
    end

  end


end
