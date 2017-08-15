class SubmissionFile < ApplicationRecord
  belongs_to :submission

  default_scope { order('seq ASC') }
end
