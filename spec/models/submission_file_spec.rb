# == Schema Information
#
# Table name: submission_files
#
#  id                     :integer          not null, primary key
#  submission_id          :integer
#  seq                    :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  submission_file_s3_key :string
#  leaderboard_video      :boolean          default(FALSE)
#
# Indexes
#
#  index_submission_files_on_submission_id  (submission_id)
#
# Foreign Keys
#
#  fk_rails_...  (submission_id => submissions.id)
#

require 'rails_helper'

describe SubmissionFile do
  context 'fields' do
    it { is_expected.to respond_to(:seq) }
    it { is_expected.to respond_to(:submission_file_s3_key) }
    it { is_expected.to respond_to(:leaderboard_video) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:submission) }
  end

  context 'indexes' do
    it { is_expected.to have_db_index ["submission_id"] }
  end
end
