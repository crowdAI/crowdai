class Email < ApplicationRecord
  belongs_to :mailer
  belongs_to :participant, optional: true
  has_many :email_transitions, autosave: false

  validates :mailer_classname, presence: true
  validates :recipients, presence: true
  validates :status_cd, presence: true

  as_enum :status, [:sent, :paused, :opened, :bounced], map: :string
end
