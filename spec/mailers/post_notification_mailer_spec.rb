require 'spec_helper'
#require 'mandrill_mailer/offline'

RSpec.describe PostNotificationMailer, type: :mailer do

  describe 'methods' do
    let(:challenge) { create :challenge, :with_events }
    let(:topic) { create :topic, challenge: challenge }
    let(:post) { create :post, topic: topic }

    before :each do
      #MandrillMailer::deliveries.clear
    end

    it 'successfully sends a message' do
      ret = described_class.new.sendmail(post.participant_id,post.id)[0][0]
      expect(ret["status"]).to eq 'sent'
      expect(ret["reject_reason"]).to eq nil
    end

    it 'send the message with the correct parameters' do
      res = described_class.new.sendmail(post.participant_id,post.id)
      byebug
      man = MandrillHelper.new(res)
      #expect(msg[:to][0][:email]).to eq post.participant.email
      expect(msg[:global_merge_vars][0][:body]).to be_a_valid_html_fragment
    end
  end


end
