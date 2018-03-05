require 'rails_helper'

describe Organizer do
  context 'associations' do
    it { is_expected.to have_many(:challenges) }
    it { is_expected.to have_many(:participants) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :organizer }
    it { is_expected.to validate_presence_of :tagline }
  end

  context 'API key' do
    let!(:organizer) { create :organizer }
    it 'API key is created when organizer account created' do
      expect(organizer.api_key.length).to eq(32)
    end

    it 'API key can be updated' do
      api_key = organizer.api_key
      organizer.update(api_key: organizer.generate_api_key)
      expect(organizer.api_key.length).to eq(32)
      expect(organizer.api_key).not_to eq(api_key)
    end
  end

end
