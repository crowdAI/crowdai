class ChallengeRegistration < SqlView
  self.primary_key = :id
  after_initialize :readonly!

  belongs_to :challenge
  belongs_to :participant
end
