# == Schema Information
#
# Table name: submissions
#
#  id                   :integer          not null, primary key
#  challenge_id         :integer
#  participant_id       :integer
#  score                :float
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  description          :text
#  score_secondary      :float
#  grading_message      :string
#  grading_status_cd    :string           default("ready")
#  description_markdown :text
#  vote_count           :integer          default(0)
#  post_challenge       :boolean          default(FALSE)
#  api                  :string
#  media_large          :string
#  media_thumbnail      :string
#  media_content_type   :string
#
# Indexes
#
#  index_submissions_on_challenge_id    (challenge_id)
#  index_submissions_on_participant_id  (participant_id)
#
# Foreign Keys
#
#  fk_rails_182329c489  (participant_id => participants.id)
#  fk_rails_62fce1582b  (challenge_id => challenges.id)
#

class Submission < ApplicationRecord
  before_validation :cache_rendered_markdown
  before_save :set_post_challenge

  belongs_to :challenge
  belongs_to :participant, optional: true
  has_many :submission_files, dependent: :destroy
  has_many :submission_grades, dependent: :destroy
  accepts_nested_attributes_for :submission_files, reject_if: lambda { |f| f[:submission_file_s3_key].blank? }, allow_destroy: true
  has_many :votes, as: :votable

  as_enum :grading_status, [:ready, :submitted, :graded, :failed], map: :string

  validates :participant_id,            presence: true
  validates :challenge_id,              presence: true
  validates :grading_status,            presence: true

  def ready?
    self.grading_status == :ready
  end

  def submitted?
    self.grading_status == :submitted
  end

  def graded?
    self.grading_status == :graded
  end

  def failed?
    self.grading_status == :failed
  end


  private
  def cache_rendered_markdown
    if self.description_markdown && description_markdown_changed?
      self.description = RenderMarkdown.new.render(description_markdown)
    end
  end

  # set flag if challenge has completed
  def set_post_challenge
    if Time.now > self.challenge.end_dttm
      self.post_challenge = true
    end
  end

end
