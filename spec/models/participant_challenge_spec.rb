require 'rails_helper'

  RSpec.describe ParticipantChallenge, type: :model do

  # === Relations ===
  it { is_expected.to belong_to :participant }
  it { is_expected.to belong_to :challenge }

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :participant_id }
  it { is_expected.to have_db_column :challenge_id }
  it { is_expected.to have_db_column :rules_accepted }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["challenge_id"] }
  it { is_expected.to have_db_index ["participant_id"] }

  # === Validations (Length) ===


  # === Validations (Presence) ===


  # === Validations (Numericality) ===



  # === Enums ===


end
