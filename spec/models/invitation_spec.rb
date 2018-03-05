require 'rails_helper'

RSpec.describe Invitation, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :challenge }
    it { is_expected.to belong_to :participant }
  end
end
