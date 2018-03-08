class SubmissionComment < ApplicationRecord
  include Markdownable

  has_paper_trail
  belongs_to :submission
  belongs_to :participant, optional: true
  has_many :votes, as: :votable

  validates :vote_count, presence: true
  validates :comment_markdown, presence: true

  def participant
    super || NullParticipant.new
  end

end
