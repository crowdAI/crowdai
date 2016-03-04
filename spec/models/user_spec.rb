require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  # pre-checks
  it "has a valid factory" do
    expect(@user).to be_valid
  end

  it "has a valid admin user factory" do
    admin_user = build(:user, :admin)
    expect(admin_user).to be_valid
    expect(admin_user.admin).to be true
  end

  it "has enforces minimum password requirements" do |variable|
    expect(@user = build(:user, password: '1234', password_confirmation: '1234')).to be_invalid
  end

  # basic validations
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
