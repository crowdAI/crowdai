class BadgeStat < SqlView
  self.primary_key = :badge_id
  after_initialize :readonly!
end
