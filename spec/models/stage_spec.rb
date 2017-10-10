require 'rails_helper'

RSpec.describe Stage, type: :model do
  context 'fields' do
    it { is_expected.to respond_to :challenge_id }
    it { is_expected.to respond_to :stage }
    it { is_expected.to respond_to :seq }
    it { is_expected.to respond_to :start_date }
    it { is_expected.to respond_to :end_date }
    it { is_expected.to respond_to :start_time }
    it { is_expected.to respond_to :end_time }
    it { is_expected.to respond_to :active }
    it { is_expected.to respond_to :leaderboard_title }
  end

  context 'associations' do
    it { is_expected.to belong_to :challenge }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:stage) }
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
    it { is_expected.to validate_presence_of(:start_time) }
    it { is_expected.to validate_presence_of(:end_time) }
    it { is_expected.to validate_presence_of(:leaderboard_title) }
    it { should validate_uniqueness_of(:stage).scoped_to(:challenge_id).case_insensitive }
    it { should validate_uniqueness_of(:start_date).scoped_to(:challenge_id).case_insensitive }
    it { should validate_uniqueness_of(:end_date).scoped_to(:challenge_id).case_insensitive }
    it { should validate_uniqueness_of(:leaderboard_title).scoped_to(:challenge_id).case_insensitive }
  end

  context 'defaults' do
    describe 'leaderboard title defaults to "Leaderboard"' do
      let(:stage) { create :stage }
      it { expect(stage.leaderboard_title).to eq('Leaderboard')}
    end
  end
end
