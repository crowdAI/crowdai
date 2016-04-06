FactoryGirl.define do
  factory :topic, class: Topic do
    challenge nil
    user nil
    topic 'MyString'
    sticky false
    views 1
    posts_count 1
  end
end
