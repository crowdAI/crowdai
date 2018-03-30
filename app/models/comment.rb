class Comment < ApplicationRecord
  include Markdownable

  has_paper_trail
  belongs_to :topic
  belongs_to :participant, optional: true
  has_many :votes, as: :votable
  has_many :notifications, as: :notifiable

  validates :vote_count, presence: true
  validates :comment_markdown, presence: true

  def participant
    super || NullParticipant.new
  end

end
