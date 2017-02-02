FactoryGirl.define do
  factory :challenge, class: Challenge do
    organizer { FactoryGirl.create :organizer }
    challenge FFaker::Lorem.sentence(3)
    tagline FFaker::Lorem.sentence(3)
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
    submission_file_definitions { [ build(:submission_file_definition)]}
    start_dttm 2.weeks.ago
    end_dttm 4.weeks.since 

    trait :running do
      status :running
      challenge FFaker::Lorem.sentence(3)
      dataset_files {[ build(:dataset_file) ]}
    end

    trait :draft do
      status :draft
      challenge FFaker::Lorem.sentence(3)
    end


  end
end
