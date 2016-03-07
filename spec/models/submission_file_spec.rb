require 'rails_helper'

RSpec.describe SubmissionFile, type: :model do
  before do
    @submission_file = build(:submission_file)
  end

  describe 'simple model pre-checks' do
    it 'has a valid factory' do
      expect(@submission_file).to be_valid
    end
  end

  describe 'fields and associations' do
    subject { @submission_file }

  end

  describe 'specific validations' do
  end
end
