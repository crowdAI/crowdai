require 'rails_helper'

RSpec.describe Competition, type: :model do
  before do
    @competition = build(:competition)
  end

  describe 'simple model pre-checks' do
    subject { @competition }

    it { should validate_presence_of(:competition) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:hosting_institution) }

    it "should allow valid values" do
      %w(draft running completed cancelled).each do |v|
        should allow_value(v).for(:status)
      end
    end
    it { should_not allow_value("other").for(:status) }
  end

  describe 'fields' do
    subject { @competition }

    it { should respond_to(:competition) }
    it { should respond_to(:start_date) }
    it { should respond_to(:end_date) }
    it { should respond_to(:status) }
    it { should respond_to(:description) }
    it { should respond_to(:evaluation) }
    it { should respond_to(:evaluation_criteria) }
    it { should respond_to(:rules) }
    it { should respond_to(:prizes) }
    it { should respond_to(:resources) }
  end

  describe 'associations' do
    subject { @competition }

    it { should respond_to(:timelines) }
    it { should respond_to(:submissions) }
    it { should respond_to(:user_competitions) }
    it { should respond_to(:users) }
  end

  describe 'specific validations' do
  end
end
