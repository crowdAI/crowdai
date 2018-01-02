class Comment < ApplicationRecord
  has_paper_trail
  belongs_to :topic
  belongs_to :participant, optional: true
  has_many :votes, as: :votable
  has_many :notifications, as: :notifiable

  before_validation :cache_rendered_markdown

  #default_scope { order('created_at desc') }

  validates :vote_count, presence: true
  validates :comment_markdown, presence: true

  def participant
    super || NullParticipant.new
  end

  private
  def cache_rendered_markdown
    if comment_markdown_changed?
      self.comment = Kramdown::Document.new(self.comment_markdown,{coderay_line_numbers: nil}).to_html
    end
  end
end
