# == Schema Information
#
# Table name: topics
#
#  id                   :integer          not null, primary key
#  challenge_id         :integer
#  participant_id       :integer
#  topic                :string
#  sticky               :boolean          default(FALSE)
#  views                :integer          default(0)
#  posts_count          :integer          default(0)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  slug                 :string
#  vote_count           :integer          default(0)
#  description          :string
#  description_markdown :string
#
# Indexes
#
#  index_topics_on_challenge_id    (challenge_id)
#  index_topics_on_participant_id  (participant_id)
#  index_topics_on_slug            (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_2d21c274d1  (challenge_id => challenges.id)
#  fk_rails_b8f223b308  (participant_id => participants.id)
#

class Topic < ApplicationRecord
  include FriendlyId
  friendly_id :topic, use: [:slugged, :finders]
  include ActionView::Helpers::DateHelper
  belongs_to :challenge
  belongs_to :participant
  has_many :comments, dependent: :destroy
  has_many :votes, as: :votable

  default_scope { order('sticky desc') }

  validates :topic, presence: true, length: { maximum: 255 }

  def should_generate_new_friendly_id?
    topic_changed?
  end


  def last_activity
    sql = %Q[
      select p.updated_at
      from posts p
      where p.topic_id = #{id}
      order by updated_at desc
    ]
    post = Post.find_by_sql(sql).first
    if post.nil?
      updated = self.updated_at if post.nil?
    else
      updated = post.updated_at
    end
    return time_ago_in_words(updated)
  end
end
