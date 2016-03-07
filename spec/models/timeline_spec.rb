require 'rails_helper'

RSpec.describe Timeline, type: :model do
  before do
    @timeline = build(:timeline)
  end

  describe 'simple model pre-checks' do
    it 'has a valid factory' do
      expect(@timeline).to be_valid
    end
  end

  describe 'fields and associations' do
    subject { @timeline }

  end

  describe 'specific validations' do
  end
end
