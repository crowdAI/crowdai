class Comment < ApplicationRecord
  has_paper_trail
  belongs_to :topic
  belongs_to :participant, optional: true
  has_many :votes, as: :votable
  has_many :notifications, as: :notifiable

  #default_scope { order('created_at desc') }

  validates :vote_count, presence: true
  validates :comment_markdown, presence: true

  def participant
    super || NullParticipant.new
  end

end
