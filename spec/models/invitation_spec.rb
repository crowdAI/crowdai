require 'rails_helper'

RSpec.describe Invitation, type: :model do
  context 'fields' do
    it { is_expected.to respond_to :challenge_id }
    it { is_expected.to respond_to :participant_id }
    it { is_expected.to respond_to :email }
  end

  context 'associations' do
    it { is_expected.to belong_to :challenge }
    it { is_expected.to belong_to :participant }
  end
end
