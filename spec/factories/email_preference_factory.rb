FactoryGirl.define do
  factory :email_preference, class: EmailPreference do
    participant
    newsletter true
    challenges_followed true
    mentions true
    receive_every_email true
    receive_daily_digest false
    receive_weekly_digest false
  end
end
