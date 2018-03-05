require 'rails_helper'

describe EmailPreference do
  context 'associations' do
    it { is_expected.to belong_to(:participant) }
  end
end
