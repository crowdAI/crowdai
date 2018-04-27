FactoryBot.define do
  factory :blog do
    participant nil
    title "MyString"
    body "MyText"
    published false
    vote_count 1
    view_count 1
  end
end
