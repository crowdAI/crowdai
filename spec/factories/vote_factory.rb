FactoryGirl.define do
  factory :vote, class: Vote do
    association :votable, factory: :challenge
    participant
  end
end
