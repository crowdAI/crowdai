require 'rails_helper'

RSpec.describe JobPosting, type: :model do
  context 'fields' do
    it { is_expected.to respond_to :title }
    it { is_expected.to respond_to :organisation }
    it { is_expected.to respond_to :contact_name }
    it { is_expected.to respond_to :contact_email }
    it { is_expected.to respond_to :contact_phone }
    it { is_expected.to respond_to :posting_date }
    it { is_expected.to respond_to :closing_date }
    it { is_expected.to respond_to :status_cd }
    it { is_expected.to respond_to :status }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :remote }
    it { is_expected.to respond_to :location }
    it { is_expected.to respond_to :country }
    it { is_expected.to respond_to :page_views }
    it { is_expected.to respond_to :job_url }
  end

end
