# == Schema Information
#
# Table name: dataset_files
#
#  id                  :integer          not null, primary key
#  seq                 :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  description         :string
#  challenge_id        :integer
#  dataset_file_s3_key :string
#  evaluation          :boolean          default(FALSE)
#  title               :string
#
# Indexes
#
#  index_dataset_files_on_challenge_id  (challenge_id)
#

FactoryGirl.define do
  factory :dataset_file, class: DatasetFile do
    challenge
    seq 1
    title "first_file"
    description FFaker::Lorem.sentence(3)
    dataset_file_s3_key 'test'
  end
end
