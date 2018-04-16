FactoryBot.define do
  factory :submission, class: Submission do
    challenge #FactoryBot.create(:challenge, :running)
    participant
    grading_status :ready
    description_markdown '#Upload description'
    post_challenge false

    trait :with_meta do
      meta {
        {
          impwt_std: 0.020956583416961033,
          ips_std: 2.0898337641716487,
          snips: 45.69345202998776,
          file_key: "submissions/07b2ccb7-a525-4e5e-97a8-8ff7199be43c"
        }
      }
    end
    trait :with_file do
      submission_files { [ build(:submission_file, submission_file_s3_key: 'submissions/07b2ccb7-a525-4e5e-97a8-8ff7199be43c') ]}
    end
  end
end
