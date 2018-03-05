require 'rails_helper'

describe SubmissionFileDefinition do
  context 'associations' do
    it { is_expected.to belong_to(:challenge) }
  end
end
