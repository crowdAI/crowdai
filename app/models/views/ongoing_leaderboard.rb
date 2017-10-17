class OngoingLeaderboard < ApplicationRecord
  self.primary_key = :id
  after_initialize :readonly!

  belongs_to :challenge
  belongs_to :participant
end

# note that the count includes ungraded entries
# This leaderboard includes submissions made after the end of the challenge
