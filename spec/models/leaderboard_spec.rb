require 'rails_helper'

RSpec.describe Leaderboard, type: :model do
  before do
    @leaderboard = Leaderboard.first
  end


  describe 'fields' do
    subject { @leaderboard }
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :row_num }
    it { is_expected.to have_db_column :challenge_id }
    it { is_expected.to have_db_column :participant_id }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :entries }
    it { is_expected.to have_db_column :score }
    it { is_expected.to have_db_column :score_secondary }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
  end

  describe 'associations' do
    subject { @leaderboard }
    it { is_expected.to belong_to :challenge }
    it { is_expected.to belong_to :participant }
  end
end
