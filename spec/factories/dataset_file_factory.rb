FactoryBot.define do
  factory :dataset_file, class: DatasetFile do
    challenge
    seq 1
    title "first_file"
    description FFaker::Lorem.sentence(3)
    dataset_file_s3_key 'test'
  end
end
