FactoryGirl.define do
  factory :topic, class: Topic do
    challenge
    participant
    topic FFaker::Lorem.sentence(3)
    sticky false
    views 1
    #after(:create) do |topic|
    #  topic.comments << FactoryGirl.create(:comment, topic: topic)
    #end

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
