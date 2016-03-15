class SubmissionFile < ActiveRecord::Base
  belongs_to :submission

  has_attached_file :submission_file
  do_not_validate_attachment_file_type :submission_file
end
