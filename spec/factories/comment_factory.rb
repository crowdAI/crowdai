FactoryGirl.define do
  factory :comment, class: Comment do
    comment { FFaker::Lorem.words(4) }
    flagged false
    topic { FactoryGirl.build :topic }
    vote_count 1
    notify false
    participant { FactoryGirl.build :participant}
  end
end
