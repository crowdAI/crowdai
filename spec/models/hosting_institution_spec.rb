require 'rails_helper'

RSpec.describe HostingInstitution, type: :model do
  before do
    @hosting_institution = build(:hosting_institution)
  end

  describe 'simple model pre-checks' do


    it { should validate_presence_of(:institution) }
  end

  describe 'fields' do
    subject { @hosting_institution }
    it { should respond_to(:institution) }
  end

  describe 'associations' do
    subject { @hosting_institution }
    it { should respond_to(:users) }
    it { should respond_to(:challenges) }
  end

  describe 'specific validations' do
  end

  # === Relations ===


  it { is_expected.to have_many :challenges }
  it { is_expected.to have_many :users }

  # === Nested Attributes ===


  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :institution }
  it { is_expected.to have_db_column :address }
  it { is_expected.to have_db_column :description }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :approved }

  # === Database (Indexes) ===


  # === Validations (Length) ===


  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :institution }
end
