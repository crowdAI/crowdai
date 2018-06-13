class EmailPreference < ApplicationRecord
  belongs_to :participant
  after_initialize :set_defaults, unless: :persisted?

  as_enum :email_frequency, [:every, :daily, :weekly],
    map: :string

  def set_defaults
    self.newsletter = true
    self.challenges_followed = true
    self.mentions = true
    self.email_frequency = :daily
  end

end
