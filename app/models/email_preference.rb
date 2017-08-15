class EmailPreference < ApplicationRecord
  belongs_to :participant
  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.newsletter = true
    self.challenges_followed = true
    self.mentions = true
    self.receive_every_email = false
    self.receive_daily_digest = true
    self.receive_weekly_digest = false
  end

end
