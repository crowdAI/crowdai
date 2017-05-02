require 'rails_helper'

RSpec.describe "admin/dataset_files_controllers/edit", type: :view do
  before(:each) do
    @admin_dataset_files_controller = assign(:admin_dataset_files_controller, Admin::DatasetFilesController.create!())
  end

  it "renders the edit admin_dataset_files_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_dataset_files_controller_path(@admin_dataset_files_controller), "post" do
    end
  end
end
