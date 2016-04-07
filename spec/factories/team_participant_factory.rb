FactoryGirl.define do
  factory :team_participant, class: TeamParticipant do
    team nil
    participant nil
    from_date '2016-02-08'
    thru_date '2016-02-08'
  end
end
