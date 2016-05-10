class ParticipantChallenge < SqlView
  belongs_to :challenge
  belongs_to :participant
end
