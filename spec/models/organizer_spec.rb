require 'rails_helper'

describe Organizer do
  context 'associations' do
    it { should have_many(:challenges) }
    it { should have_many(:participants) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :organizer }
  end
end
