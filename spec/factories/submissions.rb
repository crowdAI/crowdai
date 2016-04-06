FactoryGirl.define do
  factory :submission do
    association :challenge
    association :user
    team nil
    evaluated false
    score 1.5
    submission_type_cd "user"
  end
end
