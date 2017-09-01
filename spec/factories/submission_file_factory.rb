FactoryGirl.define do
  factory :submission_file, class: SubmissionFile do
    submission
    seq 1
    submission_file_s3_key 'test'
  end
end
