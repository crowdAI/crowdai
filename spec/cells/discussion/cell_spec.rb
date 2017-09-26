RSpec.describe Discussion::Cell, type: :cell do
  describe 'cell can be instantiated' do
    let!(:topic) { create :topic }
    let!(:participant) { create :participant }
    subject { cell(described_class, topic, current_participant: participant ) }
    it { expect( subject).to be_a Discussion::Cell }
  end
end
