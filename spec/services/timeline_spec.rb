require 'rails_helper'

RSpec.describe Timeline do
  subject { Timeline.new build(:challenge) }
  it { is_expected.to respond_to :events }
  it { is_expected.to respond_to :start_date }
  it { is_expected.to respond_to :start_dttm }
  it { is_expected.to respond_to :start_day }
  it { is_expected.to respond_to :start_month }
  it { is_expected.to respond_to :end_date }
  it { is_expected.to respond_to :end_dttm }
  it { is_expected.to respond_to :end_day }
  it { is_expected.to respond_to :end_month }
  it { is_expected.to respond_to :pct_passed }
  it { is_expected.to respond_to :pct_remaining }
  it { is_expected.to respond_to :remaining_text }

  describe '#valid?' do
    context 'challenge has no events' do
      let(:challenge) { create :challenge }
      let(:timeline) { challenge.timeline }
      it { expect(timeline).to_not be_valid }
    end
    context 'challenge has one event' do
      let(:challenge) { create :challenge, :with_event }
      let(:timeline) { challenge.timeline }
      it { expect(timeline).to_not be_valid }
    end
    context 'challenge has two events' do
      let(:challenge) { create :challenge, :with_events }
      let(:timeline) { challenge.timeline }
      it { expect(timeline).to be_valid }
    end
  end

  context 'time-dependant methods (time frozen)' do
    before { Timecop.freeze }
    after { Timecop.return }

    describe 'timeline has no milestones' do
      let(:challenge) { create :challenge, :with_events }
      let(:timeline) { challenge.timeline }
      it { expect(timeline.milestones).to be_empty }
    end

    describe 'timeline has one milestone' do
      let(:challenge) { create :challenge, :with_milestone }
      let(:timeline) { challenge.timeline }
      it { expect(timeline.milestones.count).to eq(1) }
    end

    describe 'timeline has two milestones' do
      let(:challenge) { create :challenge, :with_milestones }
      let(:timeline) { challenge.timeline }
      it { expect(timeline.milestones.count).to eq(2) }
    end

    describe '#pct' do
      let(:challenge) do
        create :challenge, events: [build(:event, event_time: 4.days.ago),
                                    build(:event, event_time: 1.day.ago),
                                    build(:event, event_time: 2.days.since)]
      end
      let(:timeline) { challenge.timeline }
      it { expect(timeline.duration_in_seconds).to eq(518400) }
      it { expect(timeline.remaining_time_in_seconds).to be_within(0.1).of(172800) }
      it { expect(timeline.pct_passed).to eq(67) }
      it { expect(timeline.pct_remaining).to eq(33) }
    end
  end

end
