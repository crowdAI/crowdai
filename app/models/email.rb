class Email < ApplicationRecord
  belongs_to :mailer

  as_enum :status, [:sent, :paused, :mandrill_sent, :mandrill_bounced], map: :string
end
