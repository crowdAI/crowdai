FactoryGirl.define do
  factory :organizer, class: Organizer do
    organizer  "First Organizer"
    address 'Campus Biotech, Geneva'
    description "Epidemiology, literally the “study of what is upon people”, is concerned with the dynamics of health and disease in human populations."
    approved true

    trait :unapproved do
      approved false
    end

    trait :second_organizer do
      organizer "Second Organizer"
    end
  end
end
