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
    it { should respond_to(:description) }

    it { should respond_to(:competition) }
    it { should respond_to(:dataset_files) }
  end

  describe 'specific validations' do
  end
end
