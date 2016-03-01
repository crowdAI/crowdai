# == Schema Information
#
# Table name: teams
#
#  id          :integer          not null, primary key
#  team        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe "Teams", type: :request do
  describe "GET /teams" do
    it "works! (now write some real specs)" do
      get teams_path
      expect(response).to have_http_status(200)
    end
  end
end
