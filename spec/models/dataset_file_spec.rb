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

require 'rails_helper'

describe DatasetFile do
  context 'fields' do
    it { is_expected.to respond_to :seq }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :dataset_file_s3_key }
    it { is_expected.to respond_to :evaluation }
  end

  context 'associations' do
    it { is_expected.to belong_to(:challenge) }
    it { is_expected.to have_many(:dataset_file_downloads) }
  end

  describe "database indexes" do
    it { is_expected.to have_db_index ["challenge_id"] }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:description) }
  end
end
