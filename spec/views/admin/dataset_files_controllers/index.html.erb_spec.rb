require 'rails_helper'

RSpec.describe "admin/dataset_files_controllers/index", type: :view do
  before(:each) do
    assign(:admin_dataset_files_controllers, [
      Admin::DatasetFilesController.create!(),
      Admin::DatasetFilesController.create!()
    ])
  end

  it "renders a list of admin/dataset_files_controllers" do
    render
  end
end
