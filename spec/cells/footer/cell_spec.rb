RSpec.describe Footer::Cell, type: :cell do
  describe 'cell can be instantiated' do
    let!(:participant) { create :participant }
    subject { cell(described_class, nil, current_participant: participant ) }
    it { expect( subject).to be_a Footer::Cell }
  end
end
