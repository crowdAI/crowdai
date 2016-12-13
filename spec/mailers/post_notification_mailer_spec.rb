require 'spec_helper'

RSpec.describe PostNotificationMailer, type: :mailer do

  describe 'methods' do
    let(:challenge) { create :challenge, :with_events }
    let(:topic) { create :topic, challenge: challenge }
    let(:post) { create :post, topic: topic }

    subject(:mailer) { described_class.new }

    it '#email_body' do
      expect(mailer.email_body(challenge,topic,post)).not_to be_empty
    end
  end


end
