class ArticleSection < ApplicationRecord
  include FriendlyId
  include Markdownable

  default_scope { order('seq ASC') }

  belongs_to :article
  validates_presence_of :section
  validates_uniqueness_of :section, allow_blank: false, scope: :article

  friendly_id :section, use: [:slugged, :finders, :history]

  def should_generate_new_friendly_id?
    section_changed?
  end

end
