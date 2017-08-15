FactoryGirl.define do
  factory :submission, class: Submission do
    challenge { FactoryGirl.create :challenge }
    association :participant
    grading_status :ready
    description_markdown '#Upload description'
    submission_files { [ build(:submission_file, submission_file_s3_key: 'project.tar') ]}
  end
end
