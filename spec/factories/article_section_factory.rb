FactoryGirl.define do
  factory :article_section do
    seq 0
    icon 'home'
    description_markdown '### Some markdown'
    section { Faker::Lorem.sentence(4) }
  end
end
