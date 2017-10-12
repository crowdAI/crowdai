class Organizer < ApplicationRecord
  include FriendlyId
  include ApiKey

  friendly_id :organizer, use: [:slugged, :finders, :history]
  has_many :challenges,   dependent: :destroy
  has_many :participants, dependent: :nullify
  validates :organizer, presence: true
  mount_uploader :image_file, ImageUploader
  validates_length_of :tagline, maximum: 140, allow_blank: true
  validates :tagline, presence: true
  after_create :set_api_key

  def approved?
    self.approved
  end

  def should_generate_new_friendly_id?
    organizer_changed?
  end
end
