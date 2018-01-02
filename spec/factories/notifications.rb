FactoryGirl.define do
  factory :notification do
    participant
    notification_type "comment"
    association :notifiable, factory: :comment
    read_at nil
    is_new true

    trait :touched do
      is_new false
    end

    trait :read do
      is_new false
      read_at 1.day.ago
    end
  end
end
