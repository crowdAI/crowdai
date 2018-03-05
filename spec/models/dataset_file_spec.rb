require 'rails_helper'

describe DatasetFile do
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
