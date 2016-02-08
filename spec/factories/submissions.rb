FactoryGirl.define do
  factory :submission do
    competition nil
    user nil
    team nil
    evaluated false
    score 1.5
    ranking 1.5
    submission_type_cd "MyString"
    withdrawn false
    withdrawn_date "2016-02-08"
  end
end
