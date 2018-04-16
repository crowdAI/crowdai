FactoryBot.define do
  factory :comment, class: Comment do
    comment_markdown "### Some markdown"
    comment { FFaker::Lorem.words(4) }
    flagged false
    topic
    vote_count 1
    notify false
    participant
  end
end
