class PreviousOngoingLeaderboard < MaterializedView
  self.primary_key = :id
  after_initialize :readonly!
end
