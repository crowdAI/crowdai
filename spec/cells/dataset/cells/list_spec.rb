RSpec.describe Dataset::Cell::List, type: :cell do
  describe 'cell can be instantiated' do
    let!(:dataset_file) { create :dataset_file }
    let!(:participant) { create :participant }
    subject { cell(described_class, dataset_file, current_participant: participant ) }
    it { expect( subject).to be_a Dataset::Cell::List }
  end
end
