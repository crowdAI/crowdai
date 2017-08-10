# == Schema Information
#
# Table name: leaderboards
#
#  id                 :integer
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

class Leaderboard < ApplicationRecord
  include SqlView

  belongs_to :challenge
  belongs_to :participant
end

# note that the count includes ungraded entries
