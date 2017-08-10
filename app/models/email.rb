# == Schema Information
#
# Table name: emails
#
#  id                      :integer          not null, primary key
#  model_id                :integer
#  mailer_classname        :string
#  recipients              :text
#  options                 :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  email_preferences_token :string
#  token_expiration_dttm   :datetime
#  participant_id          :integer
#  options_json            :jsonb
#  mailer_id               :integer
#  status_cd               :string
#
# Indexes
#
#  index_emails_on_mailer_id  (mailer_id)
#
# Foreign Keys
#
#  fk_rails_...  (mailer_id => mailers.id)
#

class Email < ApplicationRecord
  belongs_to :mailer
  belongs_to :participant, optional: true
  has_many :email_transitions, autosave: false

  validates :mailer_classname, presence: true
  validates :recipients, presence: true
  validates :status_cd, presence: true

  as_enum :status, [:sent, :paused, :opened, :bounced], map: :string
end
