require 'rails_helper'

describe EmailPreference do
  context 'fields' do
    it { is_expected.to respond_to :newsletter }
    it { is_expected.to respond_to :challenges_followed }
    it { is_expected.to respond_to :mentions }
    it { is_expected.to respond_to :receive_every_email }
    it { is_expected.to respond_to :receive_daily_digest }
    it { is_expected.to respond_to :receive_weekly_digest }
  end

  context 'associations' do
    it { is_expected.to belong_to(:participant) }
  end
end
