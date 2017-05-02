require 'rails_helper'

RSpec.describe "dataset_files_controllers/index", type: :view do
  before(:each) do
    assign(:dataset_files_controllers, [
      DatasetFilesController.create!(),
      DatasetFilesController.create!()
    ])
  end

  it "renders a list of dataset_files_controllers" do
    render
  end
end
