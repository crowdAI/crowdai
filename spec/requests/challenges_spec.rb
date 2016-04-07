# == Schema Information
#
# Table name: challenges
#
#  id                     :integer          not null, primary key
#  organizer_id :integer
#  challenge            :string
#  start_date             :date
#  end_date               :date
#  status_cd              :string
#  description            :text
#  evaluation             :text
#  evaluation_criteria    :text
#  rules                  :text
#  prizes                 :text
#  resources              :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

RSpec.describe "Challenges", type: :request do
  describe "GET /challenges" do
    it "works! (now write some real specs)" do
      get challenges_path
      expect(response).to have_http_status(200)
    end
  end
end
