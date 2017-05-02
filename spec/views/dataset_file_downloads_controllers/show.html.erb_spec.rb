require 'rails_helper'

RSpec.describe "dataset_file_downloads_controllers/show", type: :view do
  before(:each) do
    @dataset_file_downloads_controller = assign(:dataset_file_downloads_controller, DatasetFileDownloadsController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
