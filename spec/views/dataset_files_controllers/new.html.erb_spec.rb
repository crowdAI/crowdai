require 'rails_helper'

RSpec.describe "dataset_files_controllers/new", type: :view do
  before(:each) do
    assign(:dataset_files_controller, DatasetFilesController.new())
  end

  it "renders new dataset_files_controller form" do
    render

    assert_select "form[action=?][method=?]", dataset_files_controllers_path, "post" do
    end
  end
end
