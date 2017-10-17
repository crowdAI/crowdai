class Leaderboard < ApplicationRecord
  self.primary_key = :id
  after_initialize :readonly!

  belongs_to :challenge
  belongs_to :participant
end

# note that the count includes ungraded entries
# To see view text in the DB:
# SELECT *
# FROM   information_schema.VIEWS
# WHERE  table_name = 'leaderboards';
