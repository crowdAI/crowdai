# == Schema Information
#
# Table name: challenges
#
#  id                               :integer          not null, primary key
#  organizer_id                     :integer
#  challenge                        :string
#  status_cd                        :string           default("draft")
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  tagline                          :string
#  primary_sort_order_cd            :string           default("ascending")
#  secondary_sort_order_cd          :string
#  perpetual_challenge              :boolean          default(FALSE)
#  grading_factor                   :float            default(1.0)
#  grader_cd                        :string
#  answer_file_s3_key               :string
#  page_views                       :integer          default(0)
#  participant_count                :integer          default(0)
#  submission_count                 :integer          default(0)
#  score_title                      :string
#  score_secondary_title            :string
#  automatic_grading                :boolean          default(FALSE)
#  slug                             :string
#  submission_license               :string
#  api_required                     :boolean          default(FALSE)
#  daily_submissions                :integer
#  threshold                        :float
#  start_dttm                       :datetime
#  end_dttm                         :datetime
#  media_on_leaderboard             :boolean          default(FALSE)
#  challenge_client_name            :string
#  online_grading                   :boolean          default(TRUE)
#  api_key                          :string
#  vote_count                       :integer          default(0)
#  start_date                       :date
#  end_date                         :date
#  start_time                       :time
#  end_time                         :time
#  description_markdown             :text
#  description                      :text
#  evaluation_markdown              :text
#  evaluation                       :text
#  rules_markdown                   :text
#  rules                            :text
#  prizes_markdown                  :text
#  prizes                           :text
#  resources_markdown               :text
#  resources                        :text
#  submission_instructions_markdown :text
#  submission_instructions          :text
#  license_markdown                 :text
#  license                          :text
#  dataset_description_markdown     :text
#  dataset_description              :text
#  image_file                       :string
#  featured_sequence                :integer          default(0)
#
# Indexes
#
#  index_challenges_on_organizer_id  (organizer_id)
#  index_challenges_on_slug          (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (organizer_id => organizers.id)
#

FactoryGirl.define do
  factory :challenge, class: Challenge do
    organizer { FactoryGirl.create :organizer }
    challenge FFaker::Lorem.sentence(3)
    sequence(:challenge_client_name) { |n| "Client_name_#{n}" }
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
