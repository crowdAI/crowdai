class ChallengeRoundView < ApplicationRecord
  self.primary_key = :id
  after_initialize :readonly!
  
  default_scope { order("challenge_id, row_num") }

end
