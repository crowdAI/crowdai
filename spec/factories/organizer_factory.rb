# == Schema Information
#
# Table name: organizers
#
#  id                 :integer          not null, primary key
#  organizer          :string
#  address            :text
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  approved           :boolean          default(FALSE)
#  slug               :string
#  image_file         :string
#  tagline            :string
#  challenge_proposal :string
#
# Indexes
#
#  index_organizers_on_slug  (slug) UNIQUE
#

FactoryGirl.define do
  factory :organizer, class: Organizer do
    organizer  FFaker::Lorem.sentence(3)
    address FFaker::Lorem.sentence(3)
    tagline "Coke is it"
    description FFaker::Lorem.sentence(20)
    approved true

    trait :unapproved do
      approved false
    end

    trait :second_organizer do
      organizer FFaker::Lorem.sentence(3)
    end

    trait :invalid do
      organizer nil
    end
    
  end
end
