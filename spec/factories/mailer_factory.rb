FactoryGirl.define do
  factory :mailer do
    mailer_classname 'Mailer'
    paused false
  end
end
