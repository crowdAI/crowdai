FactoryGirl.define do
  factory :challenge, class: Challenge do
    organizer { FactoryGirl.create :organizer }
    challenge 'Draft Challenge'
    tagline 'Challenge tagline'
    status_cd 'draft'
    description_markdown "### The description"
    evaluation_markdown "# An evaluation"
    rules_markdown "Some *rules*"
    prizes_markdown "# Prizes are described here."
    resources_markdown "# Helpful resources"
    dataset_description_markdown " # Dataset description"
    submission_instructions_markdown "## Submission instructions"
    primary_sort_order_cd 'ascending'
    secondary_sort_order_cd 'descending'

    trait :with_event do
      events { [ build(:event) ] }
    end

    trait :with_events do
      challenge "Running Challenge"
      status_cd 'running'
      events { [ build(:event, event_time: 2.days.ago),
                build(:event, event_time: 2.days.since) ] }
    end

    trait :with_milestone do
      status_cd 'running'
      events { [ build(:event, event_time: 2.days.ago),
                 build(:event, event_time: 1.day.ago),
                 build(:event, event_time: 2.days.since) ] }
    end

    trait :with_milestones do
      challenge "Running Challenge"
      status_cd 'running'
      events { [ build(:event, event_time: 2.days.ago),
                 build(:event, event_time: 1.day.ago),
                 build(:event, event_time: 1.day.since),
                 build(:event, event_time: 2.days.since) ] }
    end

    trait :running do
      status_cd 'running'
      challenge 'Running Challenge'
    end

    trait :draft do
      status_cd 'draft'
      challenge 'Draft Challenge'
    end


  end
end
