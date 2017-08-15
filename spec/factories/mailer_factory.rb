FactoryGirl.define do
  factory :mailer, class: Mailer do
    mailer_classname 'SubmissionNotificationMailer'
    paused false
  end
end
