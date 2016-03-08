require 'rails_helper'

RSpec.describe Submission, type: :model do
  before do
    @submission = build(:submission)
  end

  describe 'simple model pre-checks' do

    it "should allow valid values" do
      %w(user team).each do |v|
        should allow_value(v).for(:submission_type)
      end
    end
    it { should_not allow_value("other").for(:submission_type) }
  end

  describe 'fields' do
    subject { @submission }

    it { should respond_to(:evaluated) }
    it { should respond_to(:score) }
    it { should respond_to(:ranking) }
    it { should respond_to(:submission_type) }
    it { should respond_to(:withdrawn) }
    it { should respond_to(:withdrawn_date) }
  end

  describe 'associations' do
    subject { @submission }

    it { should respond_to(:competition) }
    it { should respond_to(:user) }
    it { should respond_to(:team) }
    it { should respond_to(:submission_files) }
  end

  describe 'specific validations' do
  end
end
