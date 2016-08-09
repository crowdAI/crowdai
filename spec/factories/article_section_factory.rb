FactoryGirl.define do
  factory :article_section do
    seq 0
    icon 'home'
    description_markdown '### Some markdown'
    section { Faker::Lorem.words(4) }
  end
end
