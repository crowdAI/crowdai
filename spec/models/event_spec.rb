require 'rails_helper'

describe Event do
  context 'associations' do
    it { should belong_to(:challenge) }
  end

  context 'indexes' do
    it { is_expected.to have_db_index ["challenge_id"] }
  end

  context 'validations' do
    it { should validate_presence_of(:seq) }
    it { should validate_presence_of(:event) }
    it { should validate_presence_of(:event_time) }
  end
end
