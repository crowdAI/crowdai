require 'rails_helper'

RSpec.describe "admin/dataset_files_controllers/show", type: :view do
  before(:each) do
    @admin_dataset_files_controller = assign(:admin_dataset_files_controller, Admin::DatasetFilesController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
