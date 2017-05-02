require 'rails_helper'

RSpec.describe "dataset_file_downloads_controllers/edit", type: :view do
  before(:each) do
    @dataset_file_downloads_controller = assign(:dataset_file_downloads_controller, DatasetFileDownloadsController.create!())
  end

  it "renders the edit dataset_file_downloads_controller form" do
    render

    assert_select "form[action=?][method=?]", dataset_file_downloads_controller_path(@dataset_file_downloads_controller), "post" do
    end
  end
end
