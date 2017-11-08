require 'rails_helper'

RSpec.describe TaskDatasetFile, type: :model do
  context 'fields' do
    it { is_expected.to respond_to :seq }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :dataset_file_s3_key }
  end

  context 'associations' do
    it { is_expected.to belong_to(:clef_task) }
  end

  describe "database indexes" do
    it { is_expected.to have_db_index ["clef_task_id"] }
  end

end
