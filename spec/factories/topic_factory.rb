# == Schema Information
#
# Table name: topics
#
#  id             :integer          not null, primary key
#  challenge_id   :integer
#  participant_id :integer
#  topic          :string
#  sticky         :boolean          default(FALSE)
#  views          :integer          default(0)
#  posts_count    :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  slug           :string
#  vote_count     :integer          default(0)
#
# Indexes
#
#  index_topics_on_challenge_id    (challenge_id)
#  index_topics_on_participant_id  (participant_id)
#  index_topics_on_slug            (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (challenge_id => challenges.id)
#  fk_rails_...  (participant_id => participants.id)
#

FactoryGirl.define do
  factory :topic, class: Topic do
    challenge
    participant
    topic FFaker::Lorem.sentence(3)
    sticky false
    views 1

    trait :with_comments do
      after(:create) do |topic|
        topic.comments << FactoryGirl.create_list(:comment, 3, topic: topic)
        topic.participant = topic.comments.first.participant
      end
    end

    trait :invalid do
      topic nil
    end
  end
end
