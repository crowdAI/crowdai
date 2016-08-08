FactoryGirl.define do
  factory :article, class: Article do
    article { Faker::Lorem.words(4) }
    summary { Faker::Lorem.words(8) }
    participant
    category 'tensorflow'
    published false
    vote_count 0
    view_count 0
    comment_count 0
  end
end
