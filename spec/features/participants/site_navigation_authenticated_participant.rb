require 'rails_helper'

def visit_landing_page(participant)
  unless participant.nil?
    sign_in(participant)
  end
  visit '/'
end

def visit_challenges(participant)
  visit_landing_page(participant)
  within 'nav.primary' do
    click_link 'Challenges'
  end
end

def visit_challenge(participant,challenge)
  visit_landing_page(participant)
  click_link challenge.challenge
end

def visit_knowledge_base(participant)
  visit_landing_page(participant)
  within 'nav.primary' do
    click_link 'Knowledge Base'
  end
end

def visit_article(participant,article)
  visit_knowledge_base(participant)
  click_link article.article
end

feature "site navigation for authenticated participant" do
  let!(:challenge) { create(:challenge, :running) }
  let!(:participant) { create(:participant) }
  3.times do |i|
    let!("challenge_#{i + 1}") { create :challenge, :running }
  end
  3.times do |i|
    let!("article_#{i + 1}") { create :article, :with_sections }
  end

  context "landing page" do
    scenario do
      visit_landing_page(participant)
      expect(page).to have_content challenge_1.challenge
      expect(page).to have_link 'Knowledge Base'
      expect(page).to have_link 'Challenges'
      expect(page).not_to have_link 'Admin'
    end
  end

  context "challenges" do
    scenario do
      visit_challenges(participant)
      expect(page).to have_content challenge_1.challenge
      expect(page).to have_content challenge_2.challenge
      expect(page).to have_content challenge_3.challenge
    end
  end

  context 'challenge page' do
    scenario do
      visit_challenge(participant,challenge_1)
      expect(page).to have_link 'Overview'
      expect(page).to have_link 'Leaderboard'
      expect(page).to have_link 'Discussion'
      expect(page).to have_link 'Dataset'
      expect(page).to have_link 'FOLLOW'
      # TODO - icons ... expect(page).not_to have_link 'Edit'
    end
  end

  context "challenge tabs", js: true do
    scenario do
      visit_challenge(participant,challenge_1)
      click_link "Overview"
      expect(page).to have_link 'Overview', class: 'active'
      click_link "Leaderboard"
      expect(page).to have_link 'Leaderboard', class: 'active'
      click_link "Discussion"
      expect(page).to have_link 'Discussion', class: 'active'
      click_link "Dataset"
      expect(page).to have_link 'Dataset', class: 'active'
    end
  end

  context 'knowledge base' do
    scenario do
      visit_knowledge_base(participant)
      expect(page).to have_content article_1.article
      expect(page).to have_content article_2.article
      expect(page).to have_content article_3.article
    end
  end

  context 'article' do
    scenario do
      visit_article(participant,article_1)
      expect(page).to have_content article_1.article
    end
  end

  context 'participant profile' do
    scenario 'access profile via article', js: true do
      visit_article(participant,article_1)
      click_link article_1.participant.name
      expect(page).to have_css('h2', text: article_1.participant.name)
      within 'div.sub-nav' do
        expect(page).to have_link 'Challenges'
      end
    end
  end

end

=begin

  describe "challenge page" do
    before(:example) do
      visit_challenge(participant,challenge)
    end
    it { expect(page).to have_content challenge.challenge.upcase }
    it { expect(page).to have_link 'Overview' }
    it { expect(page).to have_link 'Rules' }
    it { expect(page).to have_link 'Prizes' }
    it { expect(page).to have_link 'Resources' }
    it { expect(page).to have_link 'Leaderboard' }
    it { expect(page).to have_link 'Discussion' }
    it { expect(page).to have_link 'Dataset' }
    it { expect(page).to have_link 'Submit Entry' }
    it { expect(page).not_to have_link 'Edit' }
  end

  describe "challenge page links" do
    scenario "follow Overvew link" do
      visit_challenge(participant,challenge)
      click_link "Overview"
      expect(page).to have_content 'Overview'
    end

    scenario "follow Rules link" do
      visit_challenge(participant,challenge)
      click_link "Rules"
      expect(page).to have_content 'Rules'
    end

    scenario "follow Prizes link" do
      visit_challenge(participant,challenge)
      click_link "Prizes"
      expect(page).to have_content 'Prizes'
    end

    scenario "follow Resources link" do
      visit_challenge(participant,challenge)
      click_link "Resources"
      expect(page).to have_content 'Resources'
    end

    scenario "follow Leaderboard link" do
      visit_challenge(participant,challenge)
      click_link "Leaderboard"
      expect(page).to have_css '.leaderboard'
    end

    scenario "follow Discussion link" do
      visit_challenge(participant,challenge)
      click_link "Discussion"
      expect(page).to have_css '.topics-table'
    end

    scenario "follow Dataset link" do
      visit_challenge(participant,challenge)
      click_link "Dataset"
      puts challenge.license
      expect(page).to have_content Sanitize.clean(challenge.license)
    end

    scenario "follow Submit Entry link" do
      visit_challenge(participant,challenge)
      click_link "Submit Entry"
      expect(page).to have_link 'Submit Entry'
    end
  end

  describe "own profile page" do
    before(:example) do
      visit_own_profile(participant)
    end
    it { expect(page).to have_content participant.name }
    it { expect(page).to have_content 'online now' }
    it { expect(page).to have_link 'Challenges' }
    it { expect(page).to have_link 'Notebooks' }
    it { expect(page).to have_link 'Activity' }
  end

  describe "profile page links" do
    scenario "click Challenges tab" do
      visit_own_profile(participant)
      find("#challenges").click
      expect(page).to have_content "#{participant.name} has not yet entered any challenges."
    end

    scenario "click Notebooks tab" do
      visit_own_profile(participant)
      click_link "Notebooks"
      expect(page).to have_content "#{participant.name} has not yet created any notebooks."
    end

    scenario "click Activity tab" do
      visit_own_profile(participant)
      click_link "Activity"
      expect(page).to have_content "#{participant.name} has not yet made any posts."
    end
  end


    describe "page footer links" do
      scenario "contact us link" do
        visit_challenge(participant,challenge)
        click_link "Contact us"
        expect(page).to have_text("At crowdAI we would love to hear from you.")
      end

      scenario "privacy link" do
        visit_challenge(participant,challenge)
        click_link "Privacy"
        expect(page).to have_text("In order to receive information about your Personal Data, the purposes and the parties the Data is shared with, contact the Owner.")
      end

      scenario "terms of service" do
        visit_challenge(participant,challenge)
        click_link "Terms of Service"
        expect(page).to have_text("The following terms and conditions govern all use of the crowdAI.org website and all content, services, and products available at or through the website")
      end

      scenario "twitter link" do
        visit_challenge(participant,challenge)
        find(".fa-twitter").click
        expect(page).to have_content "@crowd_ai"
      end
    end

end
=end
