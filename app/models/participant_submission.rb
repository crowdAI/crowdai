# == Schema Information
#
# Table name: participant_submissions
#
#  id                :integer
#  challenge_id      :integer
#  participant_id    :integer
#  name              :string
#  grading_status_cd :string
#  post_challenge    :boolean
#  score             :float
#  score_secondary   :float
#  files             :integer
#  created_at        :datetime
#

class ParticipantSubmission < ApplicationRecord
  include SqlView
end
