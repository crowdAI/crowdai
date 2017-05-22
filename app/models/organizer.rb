# == Schema Information
#
# Table name: organizers
#
#  id          :integer          not null, primary key
#  organizer   :string
#  address     :text
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  approved    :boolean          default(FALSE)
#  slug        :string
#  image_file  :string
#  tagline     :string
#
# Indexes
#
#  index_organizers_on_slug  (slug) UNIQUE
#

class Organizer < ApplicationRecord
  include FriendlyId
  friendly_id :organizer, use: [:slugged, :finders]
  has_many :challenges,   dependent: :destroy
  has_many :participants, dependent: :nullify
  validates :organizer, presence: true
  mount_uploader :image_file, ImageUploader
  validates_length_of :tagline, maximum: 140, allow_blank: true
  validates :tagline, presence: true

  def approved?
    self.approved
  end

  def should_generate_new_friendly_id?
    organizer_changed?
  end
end
