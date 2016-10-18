FactoryGirl.define do
  factory :submission_file_definition, class: SubmissionFileDefinition do
    seq 1
    filetype :csv
    file_required true
    submission_file_help_text Faker::Lorem.sentence(3)
    submission_file_description 'File 1'
  end
end
