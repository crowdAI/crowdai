FactoryGirl.define do
  factory :participant, class: Participant do
    sequence(:name) { |n| "name_#{n}" }
    email { FFaker::Internet.email }
    password 'password12'
    password_confirmation 'password12'
    confirmed_at Time.now
    api_key SecureRandom.hex

    trait :admin do
      admin true
    end

  end
end
