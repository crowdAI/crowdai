# == Schema Information
#
# Table name: participant_challenges
#
#  id              :integer
#  challenge_id    :integer
#  participant_id  :integer
#  organizer_id    :integer
#  challenge       :string
#  description     :text
#  rules           :text
#  prizes          :text
#  resources       :text
#  tagline         :string
#  name            :string
#  email           :string
#  last_sign_in_at :datetime
#  bio             :text
#  github          :string
#  linkedin        :string
#  twitter         :string
#

class ParticipantChallenge < ApplicationRecord
  include SqlView

  belongs_to :challenge
  belongs_to :participant
end


# This view calculates which challenges a participant is connected with, based on:
# - submissions made
# - challenge forum topics entered
# - challenge forum posts entered
# - challenge data files downloaded

# For convenience, it also includes useful fields from the participants and challenges tables
