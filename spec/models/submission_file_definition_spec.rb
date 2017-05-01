require 'rails_helper'

describe SubmissionFileDefinition do
  context 'fields' do
    it { is_expected.to respond_to(:seq) }
    it { is_expected.to respond_to(:submission_file_description) }
    it { is_expected.to respond_to(:filetype_cd) }
    it { is_expected.to respond_to(:file_required) }
    it { is_expected.to respond_to(:submission_file_help_text) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:challenge) }
  end
end
