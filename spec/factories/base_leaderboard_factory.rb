FactoryBot.define do
  factory :base_leaderboard, class: BaseLeaderboard do
    challenge
    challenge_round
    participant
    row_num 1
    score 99
    score_secondary 0.01
    leaderboard_type_cd 'leaderboard'
  end
end
