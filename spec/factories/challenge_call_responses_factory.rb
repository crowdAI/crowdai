FactoryGirl.define do
  factory :challenge_call_response do
    challenge_call
    first_name 'MyString'
    family_name 'MyString'
    email 'MyString'
    phone 'MyString'
    organization 'MyString'
    description 'MyText'
  end
end
