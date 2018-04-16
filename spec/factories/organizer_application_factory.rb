FactoryBot.define do
  factory :organizer_application, class: OrganizerApplication do
    contact_name FFaker::Name.name
    email FFaker::Internet.email
    organization FFaker::Company.name
    organization_description FFaker::Lorem.sentence(20)
    challenge_description FFaker::Lorem.sentence(20)
  end
end
