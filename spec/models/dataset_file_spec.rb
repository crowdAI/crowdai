require 'rails_helper'

RSpec.describe DatasetFile, type: :model do
  before do
    @dataset_file = build(:dataset)
  end

  describe 'simple model pre-checks' do
    it 'has a valid factory' do
      expect(@dataset_file).to be_valid
    end
  end

  describe 'fields and associations' do
    subject { @dataset_file }

  end

  describe 'specific validations' do
  end
end
