FactoryGirl.define do
  factory :post, class: Post do
    post 'MyText'
    flagged false
    topic { FactoryGirl.build :topic }
    votes 1
    notify false
    participant { FactoryGirl.build :participant}
  end
end
