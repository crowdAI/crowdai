FactoryGirl.define do
  factory :submission do
    association :competition
    association :user
    team nil
    evaluated false
    score 1.5
    ranking 1.5
    submission_type_cd "user"
    withdrawn false
    withdrawn_date "2016-02-08"
  end
end
