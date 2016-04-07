FactoryGirl.define do
  factory :participant, class: Participant do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password 'password12'
    password_confirmation 'password12'

    trait :admin do
      admin true
    end

    trait :hosting_participant do
      organizer_primary true
    end
  end
end
