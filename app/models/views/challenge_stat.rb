class ChallengeStat < SqlView
  self.primary_key = :id
  after_initialize :readonly!

  default_scope { order("id") }
end
