FactoryBot.define do
  factory :invitation do
    challenge
    participant
    email "sean@crowdai.org"
  end
end
