require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe 'basic User model pre-checks' do
    it 'has a valid factory' do
      expect(@user).to be_valid
    end

    it 'has a valid admin user factory' do
      admin_user = build(:user, :admin)
      expect(admin_user).to be_valid
      expect(admin_user.admin).to be true
    end

    it 'has enforces minimum password requirements' do |_variable|
      expect(@user = build(:user, password: '1234', password_confirmation: '1234')).to be_invalid
    end
  end

  describe 'fields and associations' do
    subject { @user }

    it { should respond_to(:username) }
    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
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
    it { should respond_to(:hosting_institution) }
    it { should respond_to(:hosting_institution_primary) }
    it { should respond_to(:user_competitions) }
    it { should respond_to(:competitions) }
    it { should respond_to(:submissions) }
    it { should_not be_admin }
  end

  describe 'specific validations' do
    it "responds to admin? with admin attribute set to 'true'" do
      @user.admin = true
      @user.save!
      expect(@user.admin?).to be true
    end

    describe 'when username is not present' do
      before { @user.username = ' ' }
      it { should_not be_valid }
    end

    describe 'when email is not present' do
      before { @user.email = ' ' }
      it { should_not be_valid }
    end

    describe 'when email format is invalid' do
      it 'should be invalid' do
        addresses = %w(user@foo,com user_at_foo.org example.user@foo.
                       foo@bar_baz.com foo@bar+baz.com foo@bar..com)
        addresses.each do |invalid_address|
          @user.email = invalid_address
          expect(@user).not_to be_valid
        end
      end
    end

    describe 'when email format is valid' do
      it 'should be valid' do
        addresses = %w(user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn)
        addresses.each do |valid_address|
          @user.email = valid_address
          expect(@user).to be_valid
        end
      end
    end

    describe 'when email address is already taken' do
      before do
        user_with_same_email = @user.dup
        user_with_same_email.email = @user.email.upcase
        user_with_same_email.save
      end

      it { should_not be_valid }
    end
  end
end
