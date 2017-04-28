class Comment < ApplicationRecord
  belongs_to :topic
  belongs_to :participant
  has_many :votes, as: :votable
  before_validation :cache_rendered_markdown

  validates :vote_count, presence: true
  default_scope { order('id asc') }

  private
  def cache_rendered_markdown
    if comment_markdown_changed?
      self.comment = RenderMarkdown.new.render(comment_markdown)
    end
  end
end
