require 'rails_helper'

RSpec.describe ChallengesPresenter do

  context 'time-dependant methods (time frozen)' do
    before { Timecop.freeze }
    after { Timecop.return }

    describe '#pct' do
      let!(:challenge) { create :challenge, start_dttm: 4.days.ago, end_dttm: 2.days.since }
      let(:presenter) { ChallengesPresenter.new(challenge) }
      it { expect(presenter.duration_in_seconds).to eq(518400) }
      it { expect(presenter.remaining_time_in_seconds).to be_within(0.1).of(172800) }
      it { expect(presenter.pct_passed).to eq(67) }
      it { expect(presenter.pct_remaining).to eq(33) }
    end
  end

end
