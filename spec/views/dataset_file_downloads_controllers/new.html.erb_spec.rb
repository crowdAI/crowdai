require 'rails_helper'

RSpec.describe "dataset_file_downloads_controllers/new", type: :view do
  before(:each) do
    assign(:dataset_file_downloads_controller, DatasetFileDownloadsController.new())
  end

  it "renders new dataset_file_downloads_controller form" do
    render

    assert_select "form[action=?][method=?]", dataset_file_downloads_controllers_path, "post" do
    end
  end
end
