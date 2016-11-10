FactoryGirl.define do
  factory :organizer, class: Organizer do
    organizer  FFaker::Lorem.sentence(3)
    address FFaker::Lorem.sentence(3)
    description FFaker::Lorem.sentence(20)
    approved true

    trait :invalid do
      organizer nil
    end

    trait :unapproved do
      approved false
    end

    trait :second_organizer do
      organizer FFaker::Lorem.sentence(3)
    end
  end
end
