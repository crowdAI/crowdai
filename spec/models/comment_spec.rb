require 'rails_helper'

describe Comment do
  context 'associations' do
    it { should belong_to(:commentable) }
    it { should belong_to(:participant) }
  end

end
