class Organizer < ApplicationRecord
  include FriendlyId
  include ApiKey
  after_create :set_api_key
  friendly_id :organizer, use: :slugged
  has_many :challenges,   dependent: :destroy
  has_many :participants, dependent: :nullify

  validates :organizer, presence: true

  def approved?
    self.approved
  end

  def set_api_key
    self.api_key = generate_api_key
  end
end
