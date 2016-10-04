FactoryGirl.define do
  factory :organizer, class: Organizer do
    organizer  Faker::Lorem.sentence(3)
    address Faker::Lorem.sentence(3)
    description Faker::Lorem.sentence(20)
    approved true

    trait :invalid do
      organizer nil
    end

    trait :unapproved do
      approved false
    end

    trait :second_organizer do
      organizer Faker::Lorem.sentence(3)
    end
  end
end
