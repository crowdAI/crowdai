class CurrentOngoingLeaderboard < SqlView
  self.primary_key = :id
  after_initialize :readonly!
end
