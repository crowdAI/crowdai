require 'rails_helper'

describe SubmissionFileDefinition do
  context 'associations' do
    it { should belong_to(:challenge) }
  end
end
