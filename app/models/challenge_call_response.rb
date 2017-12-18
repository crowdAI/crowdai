class ChallengeCallResponse < ApplicationRecord
  belongs_to :challenge_call

  validates :organization,
            :contact_name,
            :challenge_title,
            :challenge_description,
            :motivation,
            :timeline,
            :evaluation_criteria,
            :organizers_bio,
            :other,
    presence: true

    validates :email, presence: true, 'valid_email_2/email': true
end
