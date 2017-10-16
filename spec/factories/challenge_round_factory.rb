FactoryGirl.define do
  factory :challenge_round do
    challenge
    start_date 2.weeks.ago
    end_date 4.weeks.since
    start_time '09:00'
    end_time '17:00'
    active false
  end
end
