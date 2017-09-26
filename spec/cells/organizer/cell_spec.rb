RSpec.describe Organizer::Cell, type: :cell do
  describe 'cell can be instantiated' do
    let!(:organizer) { create :organizer }
    let!(:participant) { create :participant }
    subject { cell(described_class, organizer, current_participant: participant ) }
    it { expect( subject).to be_a Organizer::Cell }
  end
end
