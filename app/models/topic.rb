class Topic < ApplicationRecord
  include FriendlyId
  friendly_id :topic, use: [:slugged, :finders, :history]
  include ActionView::Helpers::DateHelper
  belongs_to :challenge
  belongs_to :participant, optional: true
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments, reject_if: :all_blank
  has_many :votes, as: :votable

  default_scope { order('created_at desc') }

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

  def participant
    super || NullParticipant.new
  end
end
