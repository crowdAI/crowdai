require 'rails_helper'

describe Email do
  context 'fields' do
    it { is_expected.to respond_to :model_id }
    it { is_expected.to respond_to :mailer_classname }
    it { is_expected.to respond_to :recipients }
    it { is_expected.to respond_to :options }
    it { is_expected.to respond_to :status_cd }
    it { is_expected.to respond_to :email_preferences_token }
    it { is_expected.to respond_to :token_expiration_dttm }
    it { is_expected.to respond_to :options_json }
    it { is_expected.to respond_to :mailer_id }
  end

  context 'associations' do
    it { is_expected.to belong_to(:mailer) }
    it { is_expected.to belong_to(:participant) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:mailer_classname) }
    it { is_expected.to validate_presence_of(:recipients) }
    it { is_expected.to validate_presence_of(:status_cd) }
  end
end
