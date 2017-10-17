class SubmissionComment < ApplicationRecord
  belongs_to :submission
  belongs_to :participant
end
