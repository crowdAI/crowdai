FactoryGirl.define do
  factory :dataset_file, class: DatasetFile do
    challenge nil
    seq 1
    description Faker::Lorem.sentence(3)
    dataset_file_s3_key 'test'
  end
end
