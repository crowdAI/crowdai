FactoryGirl.define do
  factory :team_user, class: TeamUser do
    team nil
    user nil
    from_date '2016-02-08'
    thru_date '2016-02-08'
  end
end
