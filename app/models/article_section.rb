class ArticleSection < ApplicationRecord
  include FriendlyId

  default_scope { order('seq ASC') }

  belongs_to :article

  validates_presence_of :section
  validates_uniqueness_of :section, allow_blank: false, scope: :article

  before_validation :cache_rendered_markdown

  friendly_id :section, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    section_changed?
  end

  private
  def cache_rendered_markdown
    if description_markdown_changed?
      self.description = RenderMarkdown.new.render(description_markdown)
    end
  end

end
