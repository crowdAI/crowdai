# == Schema Information
#
# Table name: submission_grades
#
#  id                :integer          not null, primary key
#  submission_id     :integer
#  grading_status_cd :string
#  grading_message   :string
#  grading_factor    :float
#  score             :float
#  score_secondary   :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  slug              :string
#
# Indexes
#
#  index_submission_grades_on_slug           (slug) UNIQUE
#  index_submission_grades_on_submission_id  (submission_id)
#
# Foreign Keys
#
#  fk_rails_8198fbcfd9  (submission_id => submissions.id)
#

class SubmissionGrade < ApplicationRecord
  belongs_to :submission
  after_save :update_submission
  after_save :notify_participant
  after_save :schedule_leaderboard_email
  default_scope { order('created_at DESC') }

  as_enum :grading_status, [:ready, :submitted, :graded, :failed], map: :string, accessor: :whiny

  validates :submission_id, presence: true
  validates :grading_status, presence: true

  def update_submission
    Submission.update(self.submission_id,
                      grading_status: self.grading_status,
                      grading_message: self.grading_message,
                      score: self.score,
                      score_secondary: self.score_secondary)
  end

  def schedule_leaderboard_email
    if self.grading_status == :graded
      LeaderboardNotificationJob.perform_later(self.submission)
    end
  end

end
