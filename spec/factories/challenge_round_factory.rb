FactoryBot.define do
  factory :challenge_round do
    challenge
    challenge_round 'Round 1'
    start_dttm 2.weeks.ago
    end_dttm 4.weeks.since
    active true
    submission_limit 5
    submission_limit_period :day
    score_precision 3
    score_secondary_precision 3
    ranking_window 48
    ranking_highlight 3
    parallel_submissions 0

    trait :historical do
      start_dttm 5.weeks.ago
      end_dttm 3.weeks.ago
      active false
    end

    trait :future do
      start_dttm 5.weeks.since
      end_dttm 7.weeks.since
      active false
    end
  end
end
