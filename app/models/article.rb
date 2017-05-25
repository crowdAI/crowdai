# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  article        :string
#  participant_id :integer
#  published      :boolean          default(FALSE)
#  vote_count     :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category       :string
#  view_count     :integer          default(0)
#  summary        :string
#  slug           :string
#  image_file     :string
#
# Indexes
#
#  index_articles_on_participant_id  (participant_id)
#  index_articles_on_slug            (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_a80d056f19  (participant_id => participants.id)
#

class Article < ApplicationRecord
  #searchkick
  include FriendlyId

  default_scope { order('updated_at DESC') }

  belongs_to :participant
  has_many :votes, as: :votable
  has_paper_trail :ignore => [:view_count, :comment_count]
  has_many :comments, as: :commentable
  has_many :article_sections, dependent: :destroy
  accepts_nested_attributes_for :article_sections, reject_if: :all_blank, allow_destroy: true

  friendly_id :article, use: [:slugged, :finders]

  scope :published, -> () { where published: true }

  validates :participant_id,    presence: true
  validates :article,           presence: true
  validates :category,          presence: true
  validates :summary,           presence: true
  validates :view_count,        presence: true
  validates :vote_count,        presence: true

  mount_uploader :image_file, ImageUploader



  def record_page_view
    self.view_count ||= 0
    self.view_count += 1
    self.save
  end

  def should_generate_new_friendly_id?
    article_changed?
  end


end
