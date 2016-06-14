class SqlViews::Leaderboard < ActiveRecord::Base
  include SqlViews::SqlView

  belongs_to :challenge
  belongs_to :participant
end

# note that the count includes ungraded entries
