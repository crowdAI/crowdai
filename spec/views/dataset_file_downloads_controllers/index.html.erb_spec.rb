require 'rails_helper'

RSpec.describe "dataset_file_downloads_controllers/index", type: :view do
  before(:each) do
    assign(:dataset_file_downloads_controllers, [
      DatasetFileDownloadsController.create!(),
      DatasetFileDownloadsController.create!()
    ])
  end

  it "renders a list of dataset_file_downloads_controllers" do
    render
  end
end
