class SqlViews::Leaderboard < ActiveRecord::Base
  include SqlView

  belongs_to :challenge
  belongs_to :participant
end

# note that the count includes ungraded entries
# This leaderboard includes submissions made after the end of the challenge
