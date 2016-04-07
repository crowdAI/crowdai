require 'rails_helper'

RSpec.describe TeamUser, type: :model do
  # === Relations ===
  it { is_expected.to belong_to :team }
  it { is_expected.to belong_to :user }



  # === Nested Attributes ===


  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :team_id }
  it { is_expected.to have_db_column :user_id }
  it { is_expected.to have_db_column :from_date }
  it { is_expected.to have_db_column :thru_date }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["team_id"] }
  it { is_expected.to have_db_index ["user_id"] }
end
