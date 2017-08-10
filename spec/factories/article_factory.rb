# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  article        :string
#  participant_id :integer
#  published      :boolean          default(FALSE)
#  vote_count     :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category       :string
#  view_count     :integer          default(0)
#  summary        :string
#  slug           :string
#  image_file     :string
#
# Indexes
#
#  index_articles_on_participant_id  (participant_id)
#  index_articles_on_slug            (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (participant_id => participants.id)
#

FactoryGirl.define do
  factory :article, class: Article do
    article FFaker::Lorem.words(10).join(' ')
    summary FFaker::Lorem.words(10).join(' ')
    participant
    category 'tensorflow'
    published true
    vote_count 0
    view_count 0

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

  end
end
