require 'rails_helper'

describe Topic do
  context 'associations' do
    it { should belong_to(:challenge) }
    it { should belong_to(:participant) }
    it { should have_many(:posts).dependent(:destroy) }
  end

  context 'indexes' do
    it { should have_db_index ["challenge_id"] }
    it { should have_db_index ["participant_id"] }
  end

  context 'validations' do
    it { should validate_presence_of(:challenge_id) }
    it { should validate_presence_of(:participant_id) }
    it { should validate_presence_of(:topic) }
    it { should validate_length_of(:topic).is_at_most(255) }
  end

end
