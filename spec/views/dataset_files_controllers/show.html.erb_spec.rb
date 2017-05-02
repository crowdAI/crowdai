require 'rails_helper'

RSpec.describe "dataset_files_controllers/show", type: :view do
  before(:each) do
    @dataset_files_controller = assign(:dataset_files_controller, DatasetFilesController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
