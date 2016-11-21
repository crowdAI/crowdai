class Post < ActiveRecord::Base
  include FriendlyId
  friendly_id :post, use: :slugged
  belongs_to :topic
  belongs_to :participant
  has_many :votes, as: :votable
  before_validation :cache_rendered_markdown

  validates :vote_count, presence: true

  private
  def cache_rendered_markdown
    if post_markdown_changed?
      self.post = RenderMarkdown.new.render(post_markdown)
    end
  end
end
