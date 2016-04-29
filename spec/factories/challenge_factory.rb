FactoryGirl.define do
  factory :challenge, class: Challenge do
    organizer { FactoryGirl.create :organizer }
    challenge 'Plant Village Disease Recognition Challenge'
    status_cd 'draft'
    description "We all have a heart. Although we often take it for granted, it's our heart that gives us the moments in life to imagine, create, and discover. "
    prizes 'MyText'
    resources 'MyText'
    dataset_description 'text'
    submission_instructions 'text'
    evaluation_markdown = 'markdown'
    evaluation_rendered = 'rendered'
  end
end
