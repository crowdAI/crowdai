FactoryGirl.define do
  factory :participant, class: Participant do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password 'password12'
    password_confirmation 'password12'
    confirmed_at Time.now

    trait :admin do
      admin true
    end

  end
end
