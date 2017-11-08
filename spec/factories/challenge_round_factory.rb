FactoryGirl.define do
  factory :challenge_round do
    challenge
    challenge_round 'Round 1'
    start_date 2.weeks.ago
    end_date 4.weeks.since
    start_time '09:00'
    end_time '17:00'
    active true
    submission_limit 5
    submission_limit_period :day

    trait :historical do
      start_date 5.weeks.ago
      end_date 3.weeks.ago
      active false
    end

    trait :future do
      start_date 5.weeks.since
      end_date 7.weeks.since
      active false
    end
  end
end
