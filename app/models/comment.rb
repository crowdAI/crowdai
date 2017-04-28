class Comment < ApplicationRecord
  include FriendlyId
  friendly_id :post, use: [:slugged, :finders]
  belongs_to :topic
  belongs_to :participant
  has_many :votes, as: :votable
  before_validation :cache_rendered_markdown

  validates :vote_count, presence: true
  default_scope { order('id asc') }


  def should_generate_new_friendly_id?
    comment_changed?
  end

  private
  def cache_rendered_markdown
    if comment_markdown_changed?
      self.comment = RenderMarkdown.new.render(comment_markdown)
    end
  end
end
