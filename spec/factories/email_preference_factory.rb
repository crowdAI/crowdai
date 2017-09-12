FactoryGirl.define do
  factory :email_preference, class: EmailPreference do
    participant
    mentions true

    trait :every_email do
      receive_every_email true
      receive_daily_digest false
      receive_weekly_digest false
    end

    trait :daily do
      receive_every_email false
      receive_daily_digest false
      receive_weekly_digest true
    end

    trait :weekly do
      receive_every_email false
      receive_daily_digest false
      receive_weekly_digest true
    end
  end
end
