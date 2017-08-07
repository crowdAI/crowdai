# == Schema Information
#
# Table name: submission_file_definitions
#
#  id                          :integer          not null, primary key
#  challenge_id                :integer
#  seq                         :integer
#  submission_file_description :string
#  filetype_cd                 :string
#  file_required               :boolean          default(FALSE)
#  submission_file_help_text   :text
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
# Indexes
#
#  index_submission_file_definitions_on_challenge_id  (challenge_id)
#
# Foreign Keys
#
#  fk_rails_...  (challenge_id => challenges.id)
#

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
