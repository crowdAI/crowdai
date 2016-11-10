FactoryGirl.define do
  factory :participant, class: Participant do
    name { FFaker::Name.first_name }
    email { FFaker::Internet.email }
    password 'password12'
    password_confirmation 'password12'
    confirmed_at Time.now

    trait :admin do
      admin true
    end

  end
end
