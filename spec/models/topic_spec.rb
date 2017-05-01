require 'rails_helper'

describe Topic do
  context 'fields' do
    it { is_expected.to respond_to :topic }
    it { is_expected.to respond_to :views }
    it { is_expected.to respond_to :vote_count }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :description_markdown }
  end

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
