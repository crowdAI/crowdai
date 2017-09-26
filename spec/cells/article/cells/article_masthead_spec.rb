RSpec.describe Article::Cell::ArticleMasthead, type: :cell do
  describe 'cell can be instantiated' do
    let!(:article) { create :article }
    let!(:participant) { create :participant }
    subject { cell(described_class, article, current_participant: participant ) }
    it { expect( subject).to be_a Article::Cell::ArticleMasthead }
  end
end
