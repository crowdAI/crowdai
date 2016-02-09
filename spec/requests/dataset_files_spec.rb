# == Schema Information
#
# Table name: dataset_files
#
#  id         :integer          not null, primary key
#  dataset_id :integer
#  seq        :integer
#  filename   :string
#  filetype   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe "DatasetFiles", type: :request do
  describe "GET /dataset_files" do
    it "works! (now write some real specs)" do
      get dataset_files_path
      expect(response).to have_http_status(200)
    end
  end
end
