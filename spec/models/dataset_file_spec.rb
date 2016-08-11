require 'rails_helper'

RSpec.describe DatasetFile, type: :model do
  let!(:dataset_file) { create(:dataset_file) }


  describe "fields" do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :seq }
    it { is_expected.to respond_to :created_at }
    it { is_expected.to respond_to :updated_at }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :dataset_file_s3_key}
    it { is_expected.to respond_to :challenge_id }
  end

  describe "associations" do
    it { is_expected.to belong_to :challenge }
    it { is_expected.to have_many :dataset_file_downloads }
  end

  describe "database indexes" do
    it { is_expected.to have_db_index ["challenge_id"] }
  end


end
