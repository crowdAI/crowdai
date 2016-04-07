class ParticipantChallenge < ActiveRecord::Base
  belongs_to :participant
  belongs_to :challenge
end
