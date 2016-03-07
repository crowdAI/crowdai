require 'rails_helper'

RSpec.describe Dataset, type: :model do
  before do
    @dataset = build(:dataset)
  end

  describe 'simple model pre-checks' do
    it 'has a valid factory' do
      expect(@dataset).to be_valid
    end
  end

  describe 'fields and associations' do
    subject { @dataset }

  end

  describe 'specific validations' do
  end
end
