# == Schema Information
#
# Table name: submissions
#
#  id                 :integer          not null, primary key
#  competition_id     :integer
#  user_id            :integer
#  team_id            :integer
#  evaluated          :boolean
#  score              :float
#  ranking            :float
#  submission_type_cd :string
#  withdrawn          :boolean
#  withdrawn_date     :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe "Submissions", type: :request do
  describe "GET /submissions" do
    it "works! (now write some real specs)" do
      get submissions_path
      expect(response).to have_http_status(200)
    end
  end
end
