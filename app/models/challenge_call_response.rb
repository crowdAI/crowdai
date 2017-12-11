class ChallengeCallResponse < ApplicationRecord
  belongs_to :challenge_call

  validates :contact_name,          presence: true
  validates :email,                 presence: true
  validates :challenge_description, presence: true
end
