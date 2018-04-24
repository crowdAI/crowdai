require 'rails_helper'

feature "create knowledge base article" do
  let(:participant) { create :participant }
  let(:admin) { create :participant, :admin }

  scenario 'not logged in' do
    visit new_article_path
    expect(page).not_to have_text 'New Tutorial'
  end

  scenario 'participant' do
    log_in(participant)
    visit new_article_path
    expect(page).to have_text 'New Tutorial'
    expect(page).to have_field(
      'article_published',
      type: 'checkbox',
      disabled: true)
  end

  scenario 'admin' do
    log_in(admin)
    visit new_article_path
    expect(page).to have_text 'New Tutorial'
    expect(page).to have_field(
      'article_published',
      type: 'checkbox',
      disabled: false)
  end

end
