FactoryBot.define do
  factory :invitation do
    challenge
    participant
    email { FFaker::Internet.unique.email }
  end
end
