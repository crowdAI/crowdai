=begin
RSpec.describe Leaderboard::Cell, type: :cell do
  describe 'cell can be instantiated' do
    let!(:leaderboard) { create :leaderboard }
    let!(:participant) { create :participant }
    subject { cell(described_class, leaderboard, current_participant: participant ) }
    it { expect( subject).to be_a Leaderboard::Cell }
  end
end
=end
