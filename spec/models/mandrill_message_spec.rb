require 'rails_helper'

describe MandrillMessage do
  context 'fields' do
    it { is_expected.to respond_to :res }
    it { is_expected.to respond_to :message }
    it { is_expected.to respond_to :meta }
  end

  context 'methods' do
    let!(:man) { create :mandrill_message }
    it { expect(man.status).to eq('sent') }
    it { expect(man.reject_reason).to be_nil }
    it { expect(man.subject).to eq("New discussion comment") }
    it { expect(man.from_name).to eq("crowdAI") }
    it { expect(man.from_email).to eq("no-reply@crowdai.org") }
    it { expect(man.email_array).to eq(["micah@satterfieldzulauf.name"]) }
    it { expect(man.merge_var('NAME')).to eq("participant_1456@example.com") }
  end
end
