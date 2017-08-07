# == Schema Information
#
# Table name: leaderboards
#
#  row_num            :integer
#  submission_id      :integer
#  challenge_id       :integer
#  participant_id     :integer
#  slug               :string
#  organizer_id       :integer
#  name               :string
#  entries            :integer
#  score              :float
#  score_secondary    :float
#  media_large        :string
#  media_thumbnail    :string
#  media_content_type :string
#  created_at         :datetime
#  updated_at         :datetime
#

require 'spec_helper'

describe Leaderboard do
  context 'associations' do
    it { is_expected.to belong_to(:challenge) }
    it { is_expected.to belong_to(:participant) }
  end
end
