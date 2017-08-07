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

require 'spec_helper'

describe ParticipantChallenge do
  context 'associations' do
    it { is_expected.to belong_to(:challenge) }
    it { is_expected.to belong_to(:participant) }
  end
end
