# == Schema Information
#
# Table name: organizer_applications
#
#  id                       :integer          not null, primary key
#  contact_name             :string
#  email                    :string
#  phone                    :string
#  organization             :string
#  organization_description :string
#  challenge_description    :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

FactoryGirl.define do
  factory :organizer_application, class: OrganizerApplication do
    contact_name FFaker::Name.name
    email FFaker::Internet.email
    organization FFaker::Company.name
    organization_description FFaker::Lorem.sentence(20)
    challenge_description FFaker::Lorem.sentence(20)
  end
end
