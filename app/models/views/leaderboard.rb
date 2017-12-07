class Leaderboard < ApplicationRecord
  self.primary_key = :id
  after_initialize :readonly!

  belongs_to :challenge
  belongs_to :participant

  default_scope { order(row_num: :asc) }
end
