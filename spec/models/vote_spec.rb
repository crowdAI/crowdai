require 'spec_helper'

describe Vote do
  context 'associations' do
    it { is_expected.to belong_to(:votable) }
    it { is_expected.to belong_to(:participant) }
  end
end
