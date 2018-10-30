class ChallengeParticipant < ApplicationRecord
  belongs_to :challenge
  belongs_to :participant, optional: true
  belongs_to :clef_task, optional: true
end
