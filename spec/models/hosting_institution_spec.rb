require 'rails_helper'

RSpec.describe HostingInstitution, type: :model do
  before do
    @hosting_institution = build(:hosting_institution)
  end

  describe 'simple model pre-checks' do


    it { should validate_presence_of(:institution) }
  end

  describe 'fields' do
    subject { @hosting_institution }
    it { should respond_to(:institution) }
  end

  describe 'associations' do
    subject { @hosting_institution }
    it { should respond_to(:users) }
    it { should respond_to(:challenges) }
  end

  describe 'specific validations' do
  end
end
