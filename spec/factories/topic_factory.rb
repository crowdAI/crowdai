FactoryGirl.define do
  factory :topic, class: Topic do
    challenge nil
    participant nil
    topic FFaker::Lorem.sentence(3)
    sticky false
    views 1
    posts_count 3

    trait :with_posts do
      after(:create) do |topic|
        topic.posts << FactoryGirl.create_list(:post, 3, topic: topic)
      end
    end
  end
end
