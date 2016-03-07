FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    username { Faker::Internet.user_name }
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
