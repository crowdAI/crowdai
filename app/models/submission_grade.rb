class SubmissionGrade < ActiveRecord::Base
  belongs_to :submission
  after_save :update_submission

  as_enum :grading_status, [:ready, :submitted, :graded, :failed], map: :string

  validates :submission_id, presence: true

  def update_submission
    Submission.update(self.submission_id,
                      grading_status: self.grading_status,
                      grading_message: self.grading_message,
                      score: self.score,
                      score_secondary: self.score_secondary)
  end
end
