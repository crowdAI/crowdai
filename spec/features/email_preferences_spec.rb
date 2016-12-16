require 'rails_helper'

feature 'Unsubscribe Token', js: true do

    let!(:challenge) { create :challenge, :with_events }
    let!(:participant) { create :participant }
    let!(:topic) { create :topic, challenge: challenge, participant: participant }
    let!(:post) { create :post, topic: topic, participant: participant }
    let!(:res) { PostNotificationMailer.new.sendmail(participant.id,post.id) }
    let!(:man) { MandrillSpecHelper.new(res) }

    scenario 'user is not logged in' do
      #puts man.unsubscribe_url
      #visit man.unsubscribe_url
      #expect(page).to have_content 'Email Preferences'
    end

    it 'user is logged in' do

    end

    it 'token has expired' do
      #expect(page).to have_content('The unsubscribe link is invalid or expired.')
    end

    it "user is logged into a different account than the token's associated account" do
      #expect(page).to have_content('The unsubscribe link is invalid or expired.')
    end


end
