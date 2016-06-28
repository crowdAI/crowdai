class ArticleSection < ActiveRecord::Base
  before_validation :cache_rendered_markdown
  belongs_to :article

  validates_presence_of :icon
  validates_presence_of :section
  validates_uniqueness_of :section, allow_blank: false, scope: :article


  private
  def cache_rendered_markdown
    if description_markdown_changed?
      self.description = RenderMarkdown.new.render(description_markdown)
    end
  end

end
