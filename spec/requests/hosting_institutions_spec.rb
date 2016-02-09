# == Schema Information
#
# Table name: hosting_institutions
#
#  id             :integer          not null, primary key
#  institution    :string
#  address        :text
#  description    :text
#  contact_person :string
#  contact_phone  :string
#  contact_email  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe "HostingInstitutions", type: :request do
  describe "GET /hosting_institutions" do
    it "works! (now write some real specs)" do
      get hosting_institutions_path
      expect(response).to have_http_status(200)
    end
  end
end
