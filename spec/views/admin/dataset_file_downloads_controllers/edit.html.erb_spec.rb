require 'rails_helper'

RSpec.describe "admin/dataset_file_downloads_controllers/edit", type: :view do
  before(:each) do
    @admin_dataset_file_downloads_controller = assign(:admin_dataset_file_downloads_controller, Admin::DatasetFileDownloadsController.create!())
  end

  it "renders the edit admin_dataset_file_downloads_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_dataset_file_downloads_controller_path(@admin_dataset_file_downloads_controller), "post" do
    end
  end
end
