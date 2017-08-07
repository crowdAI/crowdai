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
#  fk_rails_...  (participant_id => participants.id)
#  fk_rails_...  (topic_id => topics.id)
#


FactoryGirl.define do
  factory :comment, class: Comment do
    comment_markdown "### Some markdown"
    comment { FFaker::Lorem.words(4) }
    flagged false
    topic { FactoryGirl.build :topic }
    vote_count 1
    notify false
    participant { FactoryGirl.build :participant}
  end
end
