RSpec.describe Header::Cell, type: :cell do
  describe 'cell can be instantiated' do
    let!(:participant) { create :participant }
    subject { cell(described_class, nil, current_participant: participant ) }
    it { expect( subject).to be_a Header::Cell }
  end
end
