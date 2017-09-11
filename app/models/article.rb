class Article < ApplicationRecord
  #searchkick
  include FriendlyId

  default_scope { order('updated_at DESC') }

  belongs_to :participant, optional: true
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_many :article_sections, dependent: :destroy
  accepts_nested_attributes_for :article_sections, reject_if: :all_blank, allow_destroy: true

  friendly_id :article, use: [:slugged, :finders]

  scope :published, -> () { where published: true }

  validates :participant_id,    presence: true
  validates :article,           presence: true
  validates :summary,           presence: true
  validates :view_count,        presence: true
  validates :vote_count,        presence: true

  mount_uploader :image_file, ImageUploader
  validates :image_file, file_size: { less_than: 5.megabytes }

  def participant
    super || NullParticipant.new
  end

  def record_page_view
    self.view_count ||= 0
    self.view_count += 1
    self.save
  end

  def should_generate_new_friendly_id?
    article_changed?
  end

end
