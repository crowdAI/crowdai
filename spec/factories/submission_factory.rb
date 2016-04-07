FactoryGirl.define do
  factory :submission, class: Submission do
    association :challenge
    association :participant
    team nil
    evaluated false
    score 1.5
    submission_type_cd 'participant'
  end
end
