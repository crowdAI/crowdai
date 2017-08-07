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

require 'spec_helper'

describe OngoingLeaderboard do
  context 'associations' do
    it { is_expected.to belong_to(:challenge) }
    it { is_expected.to belong_to(:participant) }
  end
end
