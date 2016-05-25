require 'rails_helper'

feature "site navigation for signed in participant", js: true do

  let!(:challenge) { create(:challenge, :with_events) }
  let!(:participant) { create(:participant) }

  # http://ios-driver.github.io/ios-driver/?page=native
  # https://github.com/appium/appium_capybara


  describe "authenticated landing page" do
    before(:example) do
      visit_landing_page
    end
    specify { expect(page).to have_content challenge.challenge }
    specify { expect(page).to have_link 'Knowledge Base' }
    specify { expect(page).to have_link 'Challenges' }
    specify { expect(page).not_to have_link 'admin' }
    specify { expect(page).to have_link participant.name }
  end


  describe "access challenge page" do
    before(:example) do
      visit_challenge(challenge)
    end
    specify { expect(page).to have_content challenge.challenge }
  end

end

=begin

  scenario "open menu" do
    open_menu
    expect(page).to have_content 'Cards'
  end

  scenario "visit decks index" do
    visit_decks_index
    expect(page).to have_content 'Sample deck for French'
  end

  scenario "visit articles index" do
    visit_articles_index
    expect(page).to have_content 'Anne Guyomard, 30 ans.'
  end

  scenario "visit sentences index" do
    visit_sentences_index
    expect(page).to have_content 'Quelque 1800 réfugiés ont été interceptés.'
  end
=end
