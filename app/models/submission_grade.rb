class SubmissionGrade < ActiveRecord::Base
  after_save :update_submission
  belongs_to :submission

  as_enum :grading_status, [:ready, :submitted, :graded, :failed], map: :string

  def update_submission
    Submission.update(self.submission_id,
                      grading_status: self.grading_status,
                      grading_message: self.grading_message,
                      score: self.score,
                      score_secondary: self.score_secondary)
  end
end
