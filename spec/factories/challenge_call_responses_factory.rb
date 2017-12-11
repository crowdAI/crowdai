FactoryGirl.define do
  factory :challenge_call_response do
    challenge_call
    contact_name 'Joe Bloggs'
    email 'joe@bloggs.com.au'
    phone '12345'
    organization 'Blogger'
    challenge_description 'A super cool challenge'

    trait :invalid do
      contact_name nil
    end
  end
end
