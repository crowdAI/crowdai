require 'rails_helper'

RSpec.describe Participant, type: :model do
  before do
    @participant = build(:participant)
  end

  describe 'basic Participant model pre-checks' do

    it 'has a valid participant factory' do
      participant = build(:participant)
      expect(participant).to be_valid
    end

    it 'has a valid admin participant factory' do
      admin_participant = build(:participant, :admin)
      expect(admin_participant).to be_valid
      expect(admin_participant.admin).to be true
    end

    it 'has enforces minimum password requirements' do |_variable|
      expect(@participant = build(:participant, password: '1234', password_confirmation: '1234')).to be_invalid
    end
  end

  describe 'fields and associations' do
    subject { @participant }

    it { should respond_to(:name) }
    it { should respond_to(:email) }
    it { should respond_to(:email_public) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:admin) }
    it { should respond_to(:city) }
    it { should respond_to(:country) }
    it { should respond_to(:bio) }
    it { should respond_to(:website) }
    it { should respond_to(:github) }
    it { should respond_to(:linkedin) }
    it { should respond_to(:twitter) }
    it { should respond_to(:organizer) }
    it { should respond_to(:participant_challenges) }
    it { should respond_to(:challenges) }
    it { should respond_to(:submissions) }
    it { should_not be_admin }
  end

  describe 'specific validations' do
    it "responds to admin? with admin attribute set to 'true'" do
      @participant.admin = true
      @participant.save!
      expect(@participant.admin?).to be true
    end

    describe 'when name is not present' do
      before { @participant.name = ' ' }
      it { should_not be_valid }
    end

    describe 'when email is not present' do
      before { @participant.email = ' ' }
      it { should_not be_valid }
    end

    describe 'when email format is invalid' do
      it 'should be invalid' do
        addresses = %w(participant@foo,com participant_at_foo.org example.participant@foo.
                       foo@bar_baz.com foo@bar+baz.com foo@bar..com)
        addresses.each do |invalid_address|
          @participant.email = invalid_address
          expect(@participant).not_to be_valid
        end
      end
    end

    describe 'when email format is valid' do
      it 'should be valid' do
        addresses = %w(participant@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn)
        addresses.each do |valid_address|
          @participant.email = valid_address
          expect(@participant).to be_valid
        end
      end
    end

    describe 'when email address is already taken' do
      before do
        participant_with_same_email = @participant.dup
        participant_with_same_email.email = @participant.email.upcase
        participant_with_same_email.save
      end

      it { should_not be_valid }
    end
  end

  # === Relations ===
  it { is_expected.to belong_to :organizer }
  it { is_expected.to have_one :image }
  it { is_expected.to have_many :participant_challenges }
  it { is_expected.to have_many :challenges }
  it { is_expected.to have_many :submissions }
  it { is_expected.to have_many :team_participants }
  it { is_expected.to have_many :teams }
  it { is_expected.to have_many :posts }

  # === Nested Attributes ===
  it { is_expected.to accept_nested_attributes_for :image }

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :email }
  it { is_expected.to have_db_column :encrypted_password }
  it { is_expected.to have_db_column :reset_password_token }
  it { is_expected.to have_db_column :reset_password_sent_at }
  it { is_expected.to have_db_column :remember_created_at }
  it { is_expected.to have_db_column :sign_in_count }
  it { is_expected.to have_db_column :current_sign_in_at }
  it { is_expected.to have_db_column :last_sign_in_at }
  it { is_expected.to have_db_column :current_sign_in_ip }
  it { is_expected.to have_db_column :last_sign_in_ip }
  it { is_expected.to have_db_column :confirmation_token }
  it { is_expected.to have_db_column :confirmed_at }
  it { is_expected.to have_db_column :confirmation_sent_at }
  it { is_expected.to have_db_column :failed_attempts }
  it { is_expected.to have_db_column :unlock_token }
  it { is_expected.to have_db_column :locked_at }
  it { is_expected.to have_db_column :admin }
  it { is_expected.to have_db_column :verified }
  it { is_expected.to have_db_column :verification_date }
  it { is_expected.to have_db_column :country }
  it { is_expected.to have_db_column :city }
  it { is_expected.to have_db_column :timezone }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :unconfirmed_email }
  it { is_expected.to have_db_column :organizer_id }
  it { is_expected.to have_db_column :name }
  it { is_expected.to have_db_column :email_public }
  it { is_expected.to have_db_column :bio }
  it { is_expected.to have_db_column :website }
  it { is_expected.to have_db_column :github }
  it { is_expected.to have_db_column :linkedin }
  it { is_expected.to have_db_column :twitter }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["confirmation_token"] }
  it { is_expected.to have_db_index ["email"] }
  it { is_expected.to have_db_index ["organizer_id"] }
  it { is_expected.to have_db_index ["reset_password_token"] }
  it { is_expected.to have_db_index ["unlock_token"] }

  # === Validations (Length) ===
  it { is_expected.to allow_value(Faker::Lorem.characters(8)).for :password }
  it { is_expected.not_to allow_value(Faker::Lorem.characters(7)).for :password }
  it { is_expected.to allow_value(Faker::Lorem.characters(72)).for :password }
  it { is_expected.not_to allow_value(Faker::Lorem.characters(73)).for :password }

  # === Validations (Presence) ===
  context "with conditions" do
    before do
      allow(subject).to receive(:email_required?).and_return(true)
    end

    it { is_expected.to validate_presence_of :email }
  end

  it { is_expected.to validate_presence_of :email }
  context "with conditions" do
    before do
      allow(subject).to receive(:password_required?).and_return(true)
    end

    it { is_expected.to validate_presence_of :password }
  end
end
