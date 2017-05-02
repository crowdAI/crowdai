require 'rails_helper'

RSpec.describe "dataset_files_controllers/edit", type: :view do
  before(:each) do
    @dataset_files_controller = assign(:dataset_files_controller, DatasetFilesController.create!())
  end

  it "renders the edit dataset_files_controller form" do
    render

    assert_select "form[action=?][method=?]", dataset_files_controller_path(@dataset_files_controller), "post" do
    end
  end
end
