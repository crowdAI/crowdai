FactoryGirl.define do
  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password "password12"
    password_confirmation "password12"

    trait :admin do
      admin true
    end

    trait :hosting_user do
      hosting_institution_primary true
    end
  end

end
