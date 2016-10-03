require 'spec_helper'

describe Vote do
  context 'associations' do
    it { should belong_to(:votable) }
    it { should belong_to(:participant) }
  end
end
