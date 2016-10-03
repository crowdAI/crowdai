require 'rails_helper'

describe Post do
  context 'associations' do
    it { should belong_to(:topic) }
    it { should belong_to(:participant) }
    it { should have_many(:votes) }
  end

  context 'indexes' do
    it { should have_db_index ["topic_id"] }
    it { should have_db_index ["participant_id"] }
  end

  context 'validations' do
    it { should validate_presence_of(:topic_id) }
    it { should validate_presence_of(:participant_id) }
    it { should validate_presence_of(:vote_count) }
  end
end
