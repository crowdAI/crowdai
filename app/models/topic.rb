class Topic < ActiveRecord::Base
  belongs_to :competition
  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :topic, presence: true, length: { maximum: 255 }
end
