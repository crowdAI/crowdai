class Lboard < ApplicationRecord
  belongs_to :challenge
  belongs_to :challenge_round
  belongs_to :participant

  as_enum :leaderboard_type,
    [:leaderboard, :ongoing, :previous, :previous_ongoing],
    map: :string
end
