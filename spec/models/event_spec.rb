require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = build(:event)
  end

  describe 'simple model pre-checks' do

    it { should validate_presence_of(:event) }
    it { should validate_presence_of(:event_time) }
  end

  describe 'fields and associations' do
    subject { @event }
      it { should respond_to(:seq) }
      it { should respond_to(:event) }
      it { should respond_to(:event_time) }

      it { should respond_to(:challenge) }
  end

  describe 'specific validations' do
  end

  # === Relations ===
  it { is_expected.to belong_to :challenge }



  # === Nested Attributes ===


  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :challenge_id }
  it { is_expected.to have_db_column :seq }
  it { is_expected.to have_db_column :event }
  it { is_expected.to have_db_column :event_time }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["challenge_id"] }

  # === Validations (Length) ===


  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :event }
  it { is_expected.to validate_presence_of :event_time }
end
