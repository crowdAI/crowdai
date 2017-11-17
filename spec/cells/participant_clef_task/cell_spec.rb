RSpec.describe ParticipantClefTask::Cell, type: :cell do

  let!(:clef_task) { create :clef_task }
  let!(:participant) { create :participant }

  describe 'cell can be instantiated' do
    subject { cell(described_class, clef_task, current_participant: participant ) }
    it { expect( subject).to be_a ParticipantClefTask::Cell }
  end

  describe '#profile_incomplete?' do
    subject { cell(described_class, clef_task, current_participant: participant ) }
    context 'complete' do
      let(:participant) { create :participant, :clef_complete }
      it { expect(subject.profile_incomplete?).to be false }
    end
    context 'incomplete' do
      let(:participant) { create :participant, :clef_incomplete }
      it { expect(subject.profile_incomplete?).to be true }
    end
  end

  describe '#eua_required?' do
    let(:participant) { create :participant }
    subject { cell(described_class, clef_task, current_participant: participant) }
    context 'required' do
      let(:clef_task) { create :clef_task, :with_eua }
  #    it { expect(subject.eua_required?).to be true }
    end
    context 'not required' do
      let(:clef_task) { create :clef_task }
      #it { expect(subject.eua_required?).to be false }
    end
  end

  describe '#participant_status' do
    subject { cell(described_class, clef_task, current_participant: participant ) }
    let(:clef_task) { create :clef_task, :with_eua }

    context 'profile_incomplete' do
      let(:participant) { create :participant, :clef_incomplete }
      it { expect(subject.participant_status).to eq('profile_incomplete')}
    end

    context 'unregistered' do
      let(:participant) { create :participant, :clef_complete }
      #it { expect(subject.participant_status).to eq('unregistered')}
    end

    context 'requested' do
      let(:participant) { create :participant, :clef_complete }
      let(:participant_clef_task) { create :participant_clef_task, clef_task: clef_task, participant: participant }
  #    it { expect(subject.participant_status).to eq('requested')}
    end

    context 'registered' do

    end
  end


end
