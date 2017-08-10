# == Schema Information
#
# Table name: article_sections
#
#  id                   :integer          not null, primary key
#  article_id           :integer
#  seq                  :integer          default(1)
#  description_markdown :text
#  description          :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  section              :string
#  slug                 :string
#
# Indexes
#
#  index_article_sections_on_article_id  (article_id)
#  index_article_sections_on_slug        (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#

FactoryGirl.define do
  factory :article_section do
    seq 0
    description_markdown '### Some markdown'
    section { FFaker::Lorem.sentence(4) }
  end
end
