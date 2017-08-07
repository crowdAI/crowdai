# == Schema Information
#
# Table name: emails
#
#  id                      :integer          not null, primary key
#  model_id                :integer
#  mailer_classname        :string
#  recipients              :text
#  options                 :text
#  status_cd               :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  email_preferences_token :string
#  token_expiration_dttm   :datetime
#  participant_id          :integer
#  options_json            :jsonb
#  mailer_id               :integer
#
# Indexes
#
#  index_emails_on_mailer_id  (mailer_id)
#
# Foreign Keys
#
#  fk_rails_...  (mailer_id => mailers.id)
#

FactoryGirl.define do
  factory :email, class: Email do
    model_id 42
    mailer_classname 'SubmissionNotificationMailer'
    mailer
    recipients FFaker::Internet.email
    options '{}'
    status :sent
    participant
    options_json '{"to": "fred1270@example.com"}'
  end
end
