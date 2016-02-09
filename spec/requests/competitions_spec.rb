# == Schema Information
#
# Table name: competitions
#
#  id                     :integer          not null, primary key
#  hosting_institution_id :integer
#  competition            :string
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

RSpec.describe "Competitions", type: :request do
  describe "GET /competitions" do
    it "works! (now write some real specs)" do
      get competitions_path
      expect(response).to have_http_status(200)
    end
  end
end
