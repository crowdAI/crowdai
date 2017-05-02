require 'rails_helper'

RSpec.describe "admin/dataset_file_downloads_controllers/index", type: :view do
  before(:each) do
    assign(:admin_dataset_file_downloads_controllers, [
      Admin::DatasetFileDownloadsController.create!(),
      Admin::DatasetFileDownloadsController.create!()
    ])
  end

  it "renders a list of admin/dataset_file_downloads_controllers" do
    render
  end
end
