class Topic < ApplicationRecord
  include FriendlyId
  friendly_id :topic, use: :slugged
  include ActionView::Helpers::DateHelper
  belongs_to :challenge
  belongs_to :participant
  has_many :posts, dependent: :destroy

  default_scope { order('sticky desc') }

  validates :topic,           presence: true,
                              length: { maximum: 255 }


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
