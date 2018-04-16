FactoryBot.define do
  factory :submission_comment, class: SubmissionComment do
    comment_markdown "### Some markdown"
    comment { FFaker::Lorem.words(4) }
    submission
    vote_count 1
    participant
  end
end
