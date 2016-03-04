require 'rails_helper'

RSpec.describe Competition, type: :model do
  before do
    @competition = build(:competition)
  end

  describe 'basic User model pre-checks' do
    it 'has a valid factory' do
      expect(@competition).to be_valid
    end
  end
end
