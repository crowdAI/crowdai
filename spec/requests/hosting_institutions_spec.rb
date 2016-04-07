# == Schema Information
#
# Table name: organizers
#
#  id             :integer          not null, primary key
#  organizer    :string
#  address        :text
#  description    :text
#  contact_person :string
#  contact_phone  :string
#  contact_email  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe "Organizers", type: :request do
  describe "GET /organizers" do
    it "works! (now write some real specs)" do
      get organizers_path
      expect(response).to have_http_status(200)
    end
  end
end
