RSpec.describe Vote::Cell, type: :cell do
  describe 'cell can be instantiated' do
    let!(:comment) { create :comment }
    let!(:participant) { create :participant }
    subject { cell(described_class, comment, current_participant: participant ) }
    it { expect( subject).to be_a Vote::Cell }
  end
end
