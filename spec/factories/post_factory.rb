FactoryGirl.define do
  factory :post, class: Post do
    post { Faker::Lorem.words(4) }
    flagged false
    topic { FactoryGirl.build :topic }
    vote_count 1
    notify false
    participant { FactoryGirl.build :participant}
  end
end
