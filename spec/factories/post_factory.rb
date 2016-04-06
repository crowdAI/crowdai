FactoryGirl.define do
  factory :post, class: Post do
    topic nil
    user nil
    post 'MyText'
    votes 1
    flagged false
    notify false
  end
end
