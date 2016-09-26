class Organizer < ActiveRecord::Base
  include FriendlyId
  friendly_id :organizer, use: :slugged
  has_many :challenges,   dependent: :destroy
  has_many :participants, dependent: :nullify

  validates :organizer, presence: true

  def approved?
    self.approved
  end
end
