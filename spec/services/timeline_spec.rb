require 'rails_helper'

RSpec.describe Timeline do
  subject { Timeline.new build(:challenge) }
  it { is_expected.to respond_to :events }
  it { is_expected.to respond_to :start_date }
  it { is_expected.to respond_to :end_date }
  it { is_expected.to respond_to :pct_passed }
  it { is_expected.to respond_to :pct_left }
  it { is_expected.to respond_to :remaining_text }

  describe "#valid?" do
    context "challenge has no events" do
      let(:challenge) { create :challenge }
      let(:timeline) { challenge.timeline }
      it { expect(timeline).to_not be_valid }
    end
    context "challenge has one event" do
      let(:challenge) { create :challenge, :with_event}
      let(:timeline) { challenge.timeline }
      it { expect(timeline).to_not be_valid }
    end
    context "challenge has two events" do
      let(:challenge) { create :challenge, :with_events}
      let(:timeline) { challenge.timeline }
      it { expect(timeline).to be_valid }
    end
  end

  context "time-dependant methods (time frozen)" do
    before { Timecop.freeze }
    after { Timecop.return }

    describe "#start_date" do
      let(:challenge) { create :challenge, :with_events}
      let(:timeline) { challenge.timeline }
      it { expect(timeline.start_date).to eq(2.days.ago)}
    end

    describe "#end_date" do
      let(:challenge) { create :challenge, :with_events}
      let(:timeline) { challenge.timeline }
      it { expect(timeline.end_date).to eq(2.days.since)}
    end

    describe "timeline has no milestones" do
      let(:challenge) { create :challenge, :with_events}
      let(:timeline) { challenge.timeline }
      it { expect(timeline.milestones).to be_empty }
    end

    describe "timeline has one milestone" do
      let(:challenge) { create :challenge, :with_milestone}
      let(:timeline) { challenge.timeline }
      it { expect(timeline.milestones.count).to eq(1) }
    end

    describe "timeline has two milestones" do
      let(:challenge) { create :challenge, :with_milestones}
      let(:timeline) { challenge.timeline }
      it { expect(timeline.milestones.count).to eq(2) }
    end

    describe "#pct" do
      let(:challenge) { create :challenge, events: [ build(:event, event_time: 4.days.ago),
                 build(:event, event_time: 1.day.ago),
                 build(:event, event_time: 2.days.since) ]}
      let(:timeline) { challenge.timeline }
      it { expect(timeline.pct_passed).to eq(50) }
      it { expect(timeline.pct_remaining).to eq(50) }
    end
  end




end
