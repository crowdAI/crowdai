require 'rails_helper'

RSpec.describe CrowdaiMailer, type: :model do
  context 'fields' do
    it { is_expected.to respond_to :mailer_classname }
    it { is_expected.to respond_to :paused }
  end

  context 'associations' do
    it { is_expected.to have_many(:emails) }
  end

  context 'methods' do
    describe '#paused? and #running?' do
      context 'paused' do
        let(:mailer) { create :crowdai_mailer, paused: true }
        it { expect(mailer.paused?).to be true }
        it { expect(mailer.running?).to be false }
      end
      context 'running' do
        let(:mailer) { create :crowdai_mailer, paused: false }
        it { expect(mailer.paused?).to be false }
        it { expect(mailer.running?).to be true }
      end
    end
  end

end
