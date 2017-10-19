class ParticipantSignUp < ApplicationRecord
  self.primary_key = :id
  after_initialize :readonly!

end
