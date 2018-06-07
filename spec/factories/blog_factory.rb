FactoryBot.define do
  factory :blog do
    participant
    title { FFaker::Lorem.unique.sentence(3) }
    body_markdown { FFaker::Lorem.unique.sentence(3) }
    published true
    posted_at Time.now
    vote_count 1
    view_count 1
  end
end
