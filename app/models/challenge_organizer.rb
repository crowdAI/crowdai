class ChallengeOrganizer < ApplicationRecord
  belongs_to :challenge
  belongs_to :organizer
end
