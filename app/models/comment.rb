# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  topic_id         :integer
#  participant_id   :integer
#  comment          :text
#  flagged          :boolean          default(FALSE)
#  notify           :boolean          default(TRUE)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  vote_count       :integer          default(0)
#  slug             :string
#  comment_markdown :text
#
# Indexes
#
#  index_posts_on_participant_id  (participant_id)
#  index_posts_on_slug            (slug) UNIQUE
#  index_posts_on_topic_id        (topic_id)
#
# Foreign Keys
#
#  fk_rails_30b8c1c680  (participant_id => participants.id)
#  fk_rails_70d0b6486a  (topic_id => topics.id)
#

class Comment < ApplicationRecord
  include SearchableComment
  belongs_to :topic
  belongs_to :participant, optional: true
  has_many :votes, as: :votable
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
      self.comment = RenderMarkdown.new.render(comment_markdown)
    end
  end
end
