class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :participant
  has_many :votes, as: :votable

  validates :topic, presence: true
  validates :participant, presence: true
end
