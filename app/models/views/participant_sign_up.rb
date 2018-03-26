class ParticipantSignUp < SqlView
  self.primary_key = :id
  after_initialize :readonly!
end
