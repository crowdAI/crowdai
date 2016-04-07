require 'rails_helper'

RSpec.describe Post, type: :model do
  # === Relations ===
  it { is_expected.to belong_to :topic }
  it { is_expected.to belong_to :participant }



  # === Nested Attributes ===


  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :topic_id }
  it { is_expected.to have_db_column :participant_id }
  it { is_expected.to have_db_column :post }
  it { is_expected.to have_db_column :votes }
  it { is_expected.to have_db_column :flagged }
  it { is_expected.to have_db_column :notify }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["topic_id"] }
  it { is_expected.to have_db_index ["participant_id"] }
end
