require 'rails_helper'

RSpec.describe Topic, type: :model do
  # === Relations ===
  it { is_expected.to belong_to :challenge }
  it { is_expected.to belong_to :participant }

  it { is_expected.to have_many :posts }

  # === Nested Attributes ===


  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :challenge_id }
  it { is_expected.to have_db_column :participant_id }
  it { is_expected.to have_db_column :topic }
  it { is_expected.to have_db_column :sticky }
  it { is_expected.to have_db_column :views }
  it { is_expected.to have_db_column :posts_count }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["challenge_id"] }
  it { is_expected.to have_db_index ["participant_id"] }

  # === Validations (Length) ===
  it { is_expected.to allow_value(Faker::Lorem.characters(255)).for :topic }
  it { is_expected.not_to allow_value(Faker::Lorem.characters(256)).for :topic }

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :topic }

  
  describe '#last_activity' do
    it 'works' do
      topic = Topic.new
      result = topic.last_activity
      expect(result).not_to be_nil
    end
  end


end
