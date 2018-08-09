class Leaderboard < SqlView
  self.primary_key = :id
  after_initialize :readonly!

  belongs_to :challenge
  belongs_to :participant
  belongs_to :challenge_round

  default_scope { order(seq: :asc) }
end
