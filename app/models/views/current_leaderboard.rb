class CurrentLeaderboard < SqlView
  self.primary_key = :id
  after_initialize :readonly!

  default_scope { order(row_num: :asc) }
end
