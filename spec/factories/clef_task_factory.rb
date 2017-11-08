FactoryGirl.define do
  factory :clef_task, class: ClefTask do
    association :organizer, :clef
    task FFaker::Lorem.sentence(3)

    trait :invalid do
      task nil
    end
  end
end
