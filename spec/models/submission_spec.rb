require 'rails_helper'

RSpec.describe Submission, type: :model do
  before do
    @submission = build(:submission)
  end

  describe 'simple model pre-checks' do
    it 'has a valid factory' do
      expect(@submission).to be_valid
    end
  end

  describe 'fields and associations' do
    subject { @submission }

  end

  describe 'specific validations' do
  end
end
