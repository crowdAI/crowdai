require 'rails_helper'

RSpec.describe ChallengeCall, type: :model do
  context 'associations' do
    it { is_expected.to have_many :challenge_call_responses }
  end

  context '#call_closed?' do
    describe 'open' do
      let(:call) { build_stubbed(:challenge_call, closing_date: 2.weeks.since) }
      it { expect(call.call_closed?).to be false }
    end
    describe 'closed' do
      let(:call) { build_stubbed(:challenge_call, closing_date: 2.weeks.ago) }
      it { expect(call.call_closed?).to be true }
    end
    describe 'nil' do
      let(:call) { build_stubbed(:challenge_call, closing_date: nil ) }
      it { expect(call.call_closed?).to be false }
    end
  end

  context 'methods' do
    describe 'validate markdown fields' do
      let(:call) { create :challenge_call }
      it 'description' do
        call.update!(description_markdown: '### The description')
        expect(call.description).to eq("<h3 id=\"the-description\">The description</h3>\n")
      end
    end
  end

end
