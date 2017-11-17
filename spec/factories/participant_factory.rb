FactoryGirl.define do
  factory :participant, class: Participant do
    name { FFaker::Name.unique.first_name }
    email { FFaker::Internet.unique.email }
    password 'password12'
    password_confirmation 'password12'
    confirmed_at Time.now
    api_key SecureRandom.hex
    affiliation FFaker::Company.name
    address FFaker::Address.street_address
    city FFaker::Address.city
    country_cd FFaker::Address.country_code
    organizer nil

    trait :admin do
      admin true
    end

    trait :organizer do
      organizer { FactoryGirl.create(:organizer) }
    end

    trait :clef_organizer do
      organizer { FactoryGirl.create(:organizer, :clef) }
    end

    trait :invalid do
      name nil
    end

    trait :every_email do
      after :create do |participant|
        participant.email_preferences.first.update_columns(receive_every_email: true, receive_daily_digest: false, receive_weekly_digest: false)
      end
    end

    trait :daily do
      after :create do |participant|
        participant.email_preferences.first.update_columns(receive_every_email: false, receive_daily_digest: true, receive_weekly_digest: false)
      end
    end

    trait :weekly do
      after :create do |participant|
        participant.email_preferences.first.update_columns(receive_every_email: false, receive_daily_digest: false, receive_weekly_digest: true)
      end
    end

    trait :newsletter_true do
      after :create do |participant|
        participant.email_preferences.first.update_columns(newsletter: true)
      end
    end

    trait :newsletter_false do
      after :create do |participant|
        participant.email_preferences.first.update_columns(newsletter: false)
      end
    end

    trait :clef_incomplete do
      address nil
    end

    trait :clef_complete do
      address 'test test test'
      affiliation 'test'
      first_name 'sean'
      last_name 'carroll'
      country_cd 'AU'
      city 'melbourne'
    end

  end
end
