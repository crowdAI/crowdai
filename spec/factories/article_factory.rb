FactoryGirl.define do
  factory :article, class: Article do
    article { FFaker::Lorem.words(10) }
    summary { FFaker::Lorem.words(10) }
    participant
    category 'tensorflow'
    published true
    vote_count 0
    view_count 0

    trait :invalid do
      category nil
    end

    trait :with_sections do
      article_sections { [ build(:article_section, seq: 0),
                          build(:article_section, seq: 1),
                          build(:article_section, seq: 2) ] }
    end

    trait :with_sections_and_votes do
      vote_count 1
      article_sections { [ build(:article_section, seq: 0),
                          build(:article_section, seq: 1),
                          build(:article_section, seq: 2) ] }
    end

    trait :unpublished do
      published false
      article_sections { [ build(:article_section, seq: 0),
                          build(:article_section, seq: 1),
                          build(:article_section, seq: 2) ] }
    end
  end
end
