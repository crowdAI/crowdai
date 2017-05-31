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
#  fk_rails_d1aca45f2f  (submission_id => submissions.id)
#

class SubmissionFile < ApplicationRecord
  belongs_to :submission

  default_scope { order('seq ASC') }
end
