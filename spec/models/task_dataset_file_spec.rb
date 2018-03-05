require 'rails_helper'

RSpec.describe TaskDatasetFile, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:clef_task) }
  end

  describe "database indexes" do
    it { is_expected.to have_db_index ["clef_task_id"] }
  end

end
