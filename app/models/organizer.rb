class Organizer < ApplicationRecord
  include FriendlyId
  include ApiKey
  after_create :set_api_key
  friendly_id :organizer, use: [:slugged, :finders]
  has_many :challenges,   dependent: :destroy
  has_many :participants, dependent: :nullify
  has_one :image, as: :imageable, dependent: :destroy
  validates :organizer, presence: true
  validates :api_key, presence: true

  def approved?
    self.approved
  end

  def set_api_key
    self.api_key = generate_api_key
  end

  def should_generate_new_friendly_id?
    organizer_changed?
  end
end
