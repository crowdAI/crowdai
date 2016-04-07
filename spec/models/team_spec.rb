require 'rails_helper'

RSpec.describe Team, type: :model do
  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :team }
  it { is_expected.to have_db_column :description }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

end
