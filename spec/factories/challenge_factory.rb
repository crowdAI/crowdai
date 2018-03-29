FactoryGirl.define do
  factory :challenge, class: Challenge do
    challenge { FFaker::Lorem.unique.sentence(3) }
    sequence(:challenge_client_name) { |n| "client_name_#{n}" }
    tagline { FFaker::Lorem.unique.sentence(3) }
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

    trait :running do
      status :running
      dataset_files {[ build(:dataset_file) ]}
      after(:create) do |challenge|
        FactoryGirl.create(:challenge_round, challenge: challenge)
        FactoryGirl.create(:challenge_organizer, challenge: challenge)
      end
    end

    trait :day do
      status :running
      dataset_files {[ build(:dataset_file) ]}
      after(:create) do |challenge|
        FactoryGirl.create(
          :challenge_round,
          challenge: challenge,
          submission_limit_period: :day)
        FactoryGirl.create(:challenge_organizer, challenge: challenge)
      end
    end

    trait :week do
      status :running
      dataset_files {[ build(:dataset_file) ]}
      after(:create) do |challenge|
        FactoryGirl.create(
          :challenge_round,
          challenge: challenge,
          submission_limit_period: :week)
        FactoryGirl.create(:challenge_organizer, challenge: challenge)
      end
    end

    trait :previous_round do
      status :running
      dataset_files {[ build(:dataset_file) ]}
      after(:create) do |challenge|
        FactoryGirl.create(
          :challenge_round,
          :historical,
          challenge: challenge,
          challenge_round: 'round 1',
          submission_limit: 5,
          submission_limit_period: :round,
          start_dttm: challenge.created_at - 5.weeks,
          end_dttm: challenge.created_at - 3.weeks)
        FactoryGirl.create(
          :challenge_round,
          challenge: challenge,
          challenge_round: 'round 2',
          submission_limit: 5,
          submission_limit_period: :round,
          start_dttm: challenge.created_at - 2.weeks,
          end_dttm: challenge.created_at + 3.weeks)
        FactoryGirl.create(:challenge_organizer, challenge: challenge)
      end
    end

    trait :draft do
      status :draft
      challenge FFaker::Lorem.sentence(3)
    end

    trait :completed do
      status :completed
      challenge FFaker::Lorem.sentence(3)
      dataset_files {[ build(:dataset_file) ]}
    end

    trait :starting_soon do
      status :starting_soon
      challenge FFaker::Lorem.sentence(3)
    end

  end
end
