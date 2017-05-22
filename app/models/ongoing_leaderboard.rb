# == Schema Information
#
# Table name: ongoing_leaderboards
#
#  row_num         :integer
#  id              :integer
#  challenge_id    :integer
#  participant_id  :integer
#  name            :string
#  entries         :integer
#  score           :float
#  score_secondary :float
#  post_challenge  :boolean
#  created_at      :datetime
#  updated_at      :datetime
#

class OngoingLeaderboard < ApplicationRecord
  include SqlView

  belongs_to :challenge
  belongs_to :participant
end

# note that the count includes ungraded entries
# This leaderboard includes submissions made after the end of the challenge
