require 'rails_helper'

  RSpec.describe UserChallenge, type: :model do

  # === Relations ===
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :challenge }



  # === Nested Attributes ===


  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :user_id }
  it { is_expected.to have_db_column :challenge_id }
  it { is_expected.to have_db_column :rules_accepted }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["challenge_id"] }
  it { is_expected.to have_db_index ["user_id"] }

  # === Validations (Length) ===


  # === Validations (Presence) ===


  # === Validations (Numericality) ===



  # === Enums ===


end
