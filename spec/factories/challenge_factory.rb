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
    evaluation_markdown 'markdown'
    evaluation_rendered 'rendered'
    score_sort_cd 'ascending'
    score_secondary_sort_cd 'descending'

    trait :with_event do
      events { [ build(:event) ] }
    end

    trait :with_events do
      events { [ build(:event, event_time: 2.days.ago), build(:event, event_time: 2.days.since) ] }
    end

    trait :with_milestone do
      events { [ build(:event, event_time: 2.days.ago),
                 build(:event, event_time: 1.day.ago),
                 build(:event, event_time: 2.days.since) ] }
    end

    trait :with_milestones do
      events { [ build(:event, event_time: 2.days.ago),
                 build(:event, event_time: 1.day.ago),
                 build(:event, event_time: 1.day.since),
                 build(:event, event_time: 2.days.since) ] }
    end


  end
end
