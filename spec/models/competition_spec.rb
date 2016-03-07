require 'rails_helper'

RSpec.describe Competition, type: :model do
  before do
    @competition = build(:competition)
  end

  describe 'simple model pre-checks' do
    it 'has a valid factory' do
      expect(@competition).to be_valid
    end
  end

  describe 'fields and associations' do
    subject { @user }

    it { should respond_to(:username) }
    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
    it { should respond_to(:email) }
    it { should respond_to(:email_public) }
  end

  describe 'specific validations' do
  end
end
