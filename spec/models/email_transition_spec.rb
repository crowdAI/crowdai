require 'rails_helper'

describe EmailTransition do
  context 'fields' do
    it { is_expected.to respond_to :to_state }
    it { is_expected.to respond_to :metadata }
    it { is_expected.to respond_to :sort_key }
    it { is_expected.to respond_to :most_recent }
    it { is_expected.to respond_to :email_id }
  end

  context 'associations' do
    it { is_expected.to belong_to(:email) }
  end
end
