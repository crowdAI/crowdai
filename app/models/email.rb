class Email < ApplicationRecord
  belongs_to :challenge

  as_enum :status, [:sent, :mandrill_sent, :mandrill_bounced], map: :string
end
