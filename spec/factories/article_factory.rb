FactoryGirl.define do
  factory :article, class: Article do
    article { Faker::Lorem.words(4) }
    summary { Faker::Lorem.words(8) }
    participant
    category 'tensorflow'
    published true
    vote_count 0
    view_count 0
    comment_count 0

    trait :invalid do
      category nil
    end

    trait :with_sections do
      article_sections { [ build(:article_section, seq: 0),
                          build(:article_section, seq: 1),
                          build(:article_section, seq: 2) ] }
    end
  end
end
