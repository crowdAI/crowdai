RSpec.describe Participant::Cell::ParticipantMasthead, type: :cell do
  describe 'cell can be instantiated' do
    let!(:participant) { create :participant }
    let!(:current_participant) { create :participant }
    subject { cell(described_class, participant, current_participant: current_participant ) }
    it { expect( subject).to be_a Participant::Cell::ParticipantMasthead }
  end
end
