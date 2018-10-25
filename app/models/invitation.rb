class Invitation < ApplicationRecord
  require 'csv'
  belongs_to :challenge
  belongs_to :participant, optional: true

  validates :email, presence: true,
    'valid_email_2/email': true,
    uniqueness: { case_sensitive: false, scope: :challenge_id }

  def self.import(file, challenge_id)
    CSV.foreach(file.path, headers: true) do |row|
      Invitation.create()
    end
  end
end
