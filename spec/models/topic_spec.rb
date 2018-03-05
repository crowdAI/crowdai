require 'rails_helper'

describe Topic do
  context 'associations' do
    it { is_expected.to belong_to(:challenge) }
    it { is_expected.to belong_to(:participant) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end

  context 'indexes' do
    it { is_expected.to have_db_index ["challenge_id"] }
    it { is_expected.to have_db_index ["participant_id"] }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:topic) }
    it { is_expected.to validate_length_of(:topic).is_at_most(255) }
  end

end
