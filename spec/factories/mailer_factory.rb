# == Schema Information
#
# Table name: mailers
#
#  id               :integer          not null, primary key
#  mailer_classname :string
#  paused           :boolean          default(FALSE)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryGirl.define do
  factory :mailer, class: Mailer do
    mailer_classname 'SubmissionNotificationMailer'
    paused false
  end
end
