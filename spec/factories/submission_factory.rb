FactoryGirl.define do
  factory :submission, class: Submission do
    association :challenge
    association :participant
    evaluated false
    score 1.5
  end
end
