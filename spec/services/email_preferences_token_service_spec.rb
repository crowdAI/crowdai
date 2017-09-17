require 'rails_helper'

RSpec.describe EmailPreferencesTokenService do

  let!(:participant) { create :participant }
  let!(:email_preference) { create :email_preference, participant: participant }

  subject { described_class.new(participant) }

  context 'instantiate' do
    it { expect(subject).to be_a described_class }
    it { expect(subject).to respond_to :email_preferences_link }
    it { expect(subject).to respond_to :validate_token }
    it { expect(subject).not_to respond_to :preferences_token_url }
    it { expect(subject).not_to respond_to :generate_token }
  end

  context 'public methods' do
    describe 'email_preferences_link' do
      it { expect(subject.email_preferences_link).to be_a_valid_html_fragment }
    end

    describe 'validate_token' do
      context 'invalid_participant' do
        let!(:participant1) { create :participant }
        let!(:email_preference) { create :email_preference, participant: participant1 }
        let!(:participant2) { create :participant }
        let!(:email_preference) { create :email_preference, participant: participant2 }
        let!(:token) { described_class.new(participant1).instance_eval{ generate_token } }
        before do
          #sign_in participant2
        end

        subject { described_class.new(participant1) }
        #it { expect (subject.validate_token).to eq('invalid_participant')}
      end

      context 'valid_token' do
        let!(:participant) { create :participant }
        let!(:email_preference) { create :email_preference, participant: participant }
        let!(:token) { described_class.new(participant).instance_eval{ generate_token } }

        subject { described_class.new(participant) }
        it { expect(subject.validate_token(token)).to eq('valid_token') }
        it 'deletes the token' do
          expect {
            subject.validate_token(token)
          }.to change(EmailPreferencesToken, :count).by(-1)
        end
      end

      context 'token_expired' do
        let!(:participant) { create :participant }
        let!(:email_preference) { create :email_preference, participant: participant }
        let!(:token) { described_class.new(participant).instance_eval{ generate_token } }

        before do
          Timecop.travel(DateTime.current + 50.days )
        end

        subject { described_class.new(participant) }
        it { expect(subject.validate_token(token)).to eq('token_expired') }
        it 'deletes the token' do
          expect {
            subject.validate_token(token)
          }.to change(EmailPreferencesToken, :count).by(-1)
        end
      end

      context 'invalid_token' do
        let!(:participant) { create :participant }
        let!(:email_preference) { create :email_preference, participant: participant }
        let!(:token) { "4UBVoJhVdhEZCmOZW4G3AMbQgHPXoz8D" }

        subject { described_class.new(participant) }
        it { expect(subject.validate_token(token)).to eq('invalid_token') }
      end
    end
  end

  context 'private methods' do
    describe 'preferences_token_url' do
      it do
        expect(subject.instance_eval{ preferences_token_url }).to be_a_valid_url
      end
    end

    describe 'generate_token' do
      it 'generates a token' do
        expect((subject.instance_eval{ generate_token }).length).to eq(32)
      end
      it 'saves the token' do
        expect {
          subject.instance_eval{ generate_token }
        }.to change(EmailPreferencesToken, :count).by(1)
      end
    end
  end

end
