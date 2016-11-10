FactoryGirl.define do
  sequence(:name) { |n| "Example_name_#{n}" }

  factory :participant, class: Participant do
    name 
    email { FFaker::Internet.email }
    password 'password12'
    password_confirmation 'password12'
    confirmed_at Time.now

    trait :admin do
      admin true
    end

  end
end
