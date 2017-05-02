require 'rails_helper'

RSpec.describe "admin/dataset_file_downloads_controllers/show", type: :view do
  before(:each) do
    @admin_dataset_file_downloads_controller = assign(:admin_dataset_file_downloads_controller, Admin::DatasetFileDownloadsController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
