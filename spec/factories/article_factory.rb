FactoryBot.define do
  factory :article, class: Article do
    article { FFaker::Lorem.unique.sentence(3) }
    summary FFaker::LoremFR.paragraphs(4).join(' ')
    participant
    category 'tensorflow'
    published true
    vote_count 0
    view_count 0
    article_type 'markdown'

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

    trait :invalid do
      article nil
    end

    trait :notebook do
      notebook_url 'https://gitlab.crowdai.org/crowdai-dojo/encoding-cat-vars-in-practice'
    end

  end
end
