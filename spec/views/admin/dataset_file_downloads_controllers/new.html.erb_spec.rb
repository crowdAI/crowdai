require 'rails_helper'

RSpec.describe "admin/dataset_file_downloads_controllers/new", type: :view do
  before(:each) do
    assign(:admin_dataset_file_downloads_controller, Admin::DatasetFileDownloadsController.new())
  end

  it "renders new admin_dataset_file_downloads_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_dataset_file_downloads_controllers_path, "post" do
    end
  end
end
