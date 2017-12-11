FactoryGirl.define do
  factory :challenge_call do
    organizer
    title 'MyString'
    website 'MyString'
    active true
    closing_date '2017-12-08 16:55:03 +0100'
    description 'MyText'
    slug 'MyString'
  end
end
