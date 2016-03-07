require 'rails_helper'

RSpec.describe HostingInstitution, type: :model do
  before do
    @hosting_institution = build(:hosting_institution)
  end

  describe 'simple model pre-checks' do
    it 'has a valid factory' do
      expect(@hosting_institution).to be_valid
    end
  end

  describe 'fields and associations' do
    subject { @hosting_institution }

  end

  describe 'specific validations' do
  end
end
