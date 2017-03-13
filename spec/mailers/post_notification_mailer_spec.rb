require 'spec_helper'

RSpec.describe PostNotificationMailer, type: :mailer do

  describe 'methods' do
    let(:challenge) { create :challenge }
    let(:participant) { create :participant }
    let(:post) { create :post, participant: participant }
    let!(:mailer) { create :mailer, mailer_classname: described_class.to_s }


    it 'successfully sends a message' do
      res = described_class.new.sendmail(participant.id,post.id)
      man = MandrillSpecHelper.new(res)
      expect(man.status).to eq 'sent'
      expect(man.reject_reason).to eq nil
    end

    it 'addresses the email to the participant' do
      res = described_class.new.sendmail(participant.id,post.id)
      man = MandrillSpecHelper.new(res)
      expect(man.merge_var('NAME')).to eq(participant.name)
    end

    it 'produces a body which is correct HTML' do
      res = described_class.new.sendmail(participant.id,post.id)
      man = MandrillSpecHelper.new(res)
      expect(man.merge_var('BODY')).to be_a_valid_html_fragment
    end

    it 'produces a valid challenge link' do
      link = described_class.new.challenge_link(challenge)
      expect(link).to be_a_valid_html_fragment
      expect(link).to include(ENV['HOST'])
    end

    it 'produces a valid new_post link' do
      link = described_class.new.new_post_link(challenge)
      expect(link).to be_a_valid_html_fragment
      expect(link).to include(ENV['HOST'])
    end
  end

end
