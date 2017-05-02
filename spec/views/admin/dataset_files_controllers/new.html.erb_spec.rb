require 'rails_helper'

RSpec.describe "admin/dataset_files_controllers/new", type: :view do
  before(:each) do
    assign(:admin_dataset_files_controller, Admin::DatasetFilesController.new())
  end

  it "renders new admin_dataset_files_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_dataset_files_controllers_path, "post" do
    end
  end
end
