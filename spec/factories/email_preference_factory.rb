FactoryBot.define do
  factory :email_preference, class: EmailPreference do
    participant
    mentions true
    newsletter true
    email_frequency :weekly
  end
end
