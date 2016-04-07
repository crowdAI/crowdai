FactoryGirl.define do
  factory :organizer, class: Organizer do
    organizer  "EPFL Salathé Lab"
    address 'Campus Biotech, Geneva'
    description " Epidemiology, literally the “study of what is upon people”, is concerned with the dynamics of health and disease in human populations."
    approved true
  end
end
