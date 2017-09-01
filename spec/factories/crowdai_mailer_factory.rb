FactoryGirl.define do
  factory :crowdai_mailer, class: CrowdaiMailer do
    mailer_classname 'SubmissionNotificationMailer'
    paused false
  end
end
