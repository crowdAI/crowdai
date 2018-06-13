FactoryBot.define do
  factory :email_preference, class: EmailPreference do
    participant
    mentions true
    newsletter true
  end
end
