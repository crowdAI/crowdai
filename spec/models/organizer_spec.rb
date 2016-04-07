require 'rails_helper'

RSpec.describe Organizer, type: :model do
  before do
    @organizer = build(:organizer)
  end

  describe 'simple model pre-checks' do
    it { should validate_presence_of(:organizer) }
  end

  describe 'fields' do
    subject { @organizer }
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :organizer }
    it { is_expected.to have_db_column :address }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
    it { is_expected.to have_db_column :approved }
  end

  describe 'associations' do
    subject { @organizer }
    it { is_expected.to have_many :challenges }
    it { is_expected.to have_many :participants }
  end

  describe 'specific validations' do
    it { is_expected.to validate_presence_of :organizer }
  end

end
