class Post < ActiveRecord::Base
  include FriendlyId
  friendly_id :post, use: :slugged
  belongs_to :topic
  belongs_to :participant
  has_many :votes, as: :votable

  validates :vote_count, presence: true
end
