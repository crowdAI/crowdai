require 'rails_helper'

describe ClefTask do
  context 'fields' do
    it { is_expected.to respond_to :task }
    it { is_expected.to respond_to :organizer_id }
  end

  context 'associations' do
    it { is_expected.to belong_to(:organizer) }
    it { is_expected.to have_many(:task_dataset_files) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:task) }
  end
end
