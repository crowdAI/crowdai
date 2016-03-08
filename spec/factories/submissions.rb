FactoryGirl.define do
  factory :submission do
    association :competition
    association :user
    team nil
    evaluated true
    score 1.5
    ranking 1.5
    submission_type "user"
    withdrawn true
    withdrawn_date "2016-02-08"
  end
end
