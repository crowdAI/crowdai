class SubmissionFile < ActiveRecord::Base
  belongs_to :submission

  default_scope { order('seq ASC') }
end
