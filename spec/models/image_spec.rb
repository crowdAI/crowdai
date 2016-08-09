require 'rails_helper'

RSpec.describe Image, type: :model do
  # === Relations ===
  it { is_expected.to belong_to :imageable }

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :imageable_id }
  it { is_expected.to have_db_column :imageable_type }
  it { is_expected.to have_db_column :description }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :image_file_name }
  it { is_expected.to have_db_column :image_content_type }
  it { is_expected.to have_db_column :image_file_size }
  it { is_expected.to have_db_column :image_updated_at }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["imageable_type", "imageable_id"] }
end
