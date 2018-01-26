require 'rails_helper'

RSpec.describe ChallengePartner, type: :model do
  context 'fields' do
    it { is_expected.to respond_to :image_file }
    it { is_expected.to respond_to :partner_url }
  end

  context 'associations' do
    it { is_expected.to belong_to(:challenge) }
  end
end
