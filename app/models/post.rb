class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :participant

  validates :topic, presence: true
  validates :participant, presence: true
end
