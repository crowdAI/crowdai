require 'rails_helper'

RSpec.describe Timeline, type: :model do
  before do
    @timeline = build(:timeline)
  end

  describe 'simple model pre-checks' do

    it { should validate_presence_of(:event) }
    it { should validate_presence_of(:event_time) }
  end

  describe 'fields and associations' do
    subject { @timeline }
      it { should respond_to(:seq) }
      it { should respond_to(:event) }
      it { should respond_to(:event_time) }

      it { should respond_to(:challenge) }
  end

  describe 'specific validations' do
  end
end
