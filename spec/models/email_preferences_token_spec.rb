require 'rails_helper'

describe EmailPreferencesToken do
  context 'fields' do
    it { is_expected.to respond_to :participant_id }
    it { is_expected.to respond_to :email_preferences_token }
    it { is_expected.to respond_to :token_expiration_dttm }
  end

  context 'associations' do
    it { is_expected.to belong_to :participant }
  end
end
