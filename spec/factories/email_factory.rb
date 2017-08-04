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
