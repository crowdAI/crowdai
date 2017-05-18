FactoryGirl.define do
  factory :comment, class: Comment do
    comment_markdown "### Some markdown"
    comment { FFaker::Lorem.words(4) }
    flagged false
    topic { FactoryGirl.build :topic }
    vote_count 1
    notify false
    participant { FactoryGirl.build :participant}
  end
end
