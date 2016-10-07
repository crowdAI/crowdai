FactoryGirl.define do
  factory :challenge, class: Challenge do
    organizer { FactoryGirl.create :organizer }
    challenge Faker::Lorem.sentence(3)
    tagline Faker::Lorem.sentence(3)
    status :draft
    description_markdown "### The description"
    evaluation_markdown "# An evaluation"
    rules_markdown "Some *rules*"
    prizes_markdown "# Prizes are described here."
    resources_markdown "# Helpful resources"
    dataset_description_markdown "# Dataset description"
    submission_instructions_markdown "## Submission instructions"
    primary_sort_order_cd 'ascending'
    secondary_sort_order_cd 'descending'
    grader 'f1_logloss'
    grading_factor 0.3
    license_markdown '## This is a license'


    trait :with_event do
      events { [ build(:event) ] }
    end

    trait :with_events do
      challenge Faker::Lorem.sentence(3)
      status :running
      events { [ build(:event, event_time: 2.days.ago),
                build(:event, event_time: 2.days.since) ] }
      dataset_files {[ build(:dataset_file) ]}
    end

    trait :with_milestone do
      status :running
      events { [ build(:event, event_time: 2.weeks.ago),
                 build(:event, event_time: 1.week.ago),
                 build(:event, event_time: 2.weeks.since) ] }
      dataset_files {[ build(:dataset_file) ]}
    end

    trait :future do
      status :running
      events { [ build(:event, event_time: 2.weeks.since),
                 build(:event, event_time: 3.weeks.since),
                 build(:event, event_time: 5.weeks.since) ] }
      dataset_files {[ build(:dataset_file) ]}
    end

    trait :past do
      status :running
      events { [ build(:event, event_time: 5.weeks.ago),
                 build(:event, event_time: 3.weeks.ago),
                 build(:event, event_time: 2.weeks.ago) ] }
      dataset_files {[ build(:dataset_file) ]}
    end

    trait :draft_with_milestone do
      status :draft
      events { [ build(:event, event_time: 2.days.ago),
                 build(:event, event_time: 1.day.ago),
                 build(:event, event_time: 2.days.since) ] }
      dataset_files {[ build(:dataset_file) ]}
    end

    trait :with_milestones do
      challenge Faker::Lorem.sentence(3)
      status :running
      events { [ build(:event, event_time: 2.days.ago),
                 build(:event, event_time: 1.day.ago),
                 build(:event, event_time: 1.day.since),
                 build(:event, event_time: 2.days.since) ] }
      dataset_files {[ build(:dataset_file) ]}
    end

    trait :running do
      status :running
      challenge Faker::Lorem.sentence(3)
      dataset_files {[ build(:dataset_file) ]}
    end

    trait :draft do
      status :draft
      challenge Faker::Lorem.sentence(3)
    end


  end
end
