# == Schema Information
#
# Table name: participants
#
#  id                      :integer          not null, primary key
#  email                   :string           default(""), not null
#  encrypted_password      :string           default(""), not null
#  reset_password_token    :string
#  reset_password_sent_at  :datetime
#  remember_created_at     :datetime
#  sign_in_count           :integer          default(0), not null
#  current_sign_in_at      :datetime
#  last_sign_in_at         :datetime
#  current_sign_in_ip      :inet
#  last_sign_in_ip         :inet
#  confirmation_token      :string
#  confirmed_at            :datetime
#  confirmation_sent_at    :datetime
#  failed_attempts         :integer          default(0), not null
#  unlock_token            :string
#  locked_at               :datetime
#  admin                   :boolean          default(FALSE)
#  verified                :boolean          default(FALSE)
#  verification_date       :date
#  timezone                :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  unconfirmed_email       :string
#  organizer_id            :integer
#  name                    :string
#  email_public            :boolean          default(FALSE)
#  bio                     :text
#  website                 :string
#  github                  :string
#  linkedin                :string
#  twitter                 :string
#  account_disabled        :boolean          default(FALSE)
#  account_disabled_reason :text
#  account_disabled_dttm   :datetime
#  slug                    :string
#  api_key                 :string
#  location                :string
#  image_file              :string
#
# Indexes
#
#  index_participants_on_confirmation_token    (confirmation_token) UNIQUE
#  index_participants_on_email                 (email) UNIQUE
#  index_participants_on_organizer_id          (organizer_id)
#  index_participants_on_reset_password_token  (reset_password_token) UNIQUE
#  index_participants_on_slug                  (slug) UNIQUE
#  index_participants_on_unlock_token          (unlock_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (organizer_id => organizers.id)
#

FactoryGirl.define do
  factory :participant, class: Participant do
    name { "participant_#{Random.rand(10000).to_s}@example.com" }
    email { FFaker::Internet.email }
    password 'password12'
    password_confirmation 'password12'
    confirmed_at Time.now
    api_key SecureRandom.hex

    trait :admin do
      admin true
    end

    trait :invalid do
      name nil
    end

  end
end
