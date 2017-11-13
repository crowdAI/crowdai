require 'rails_helper'

RSpec.describe "task_dataset_file_downloads/edit", type: :view do
  before(:each) do
    @task_dataset_file_download = assign(:task_dataset_file_download, TaskDatasetFileDownload.create!(
      :participant => "",
      :task_dataset_file => "",
      :ip_address => "MyString"
    ))
  end

  it "renders the edit task_dataset_file_download form" do
    render

    assert_select "form[action=?][method=?]", task_dataset_file_download_path(@task_dataset_file_download), "post" do

      assert_select "input[name=?]", "task_dataset_file_download[participant]"

      assert_select "input[name=?]", "task_dataset_file_download[task_dataset_file]"

      assert_select "input[name=?]", "task_dataset_file_download[ip_address]"
    end
  end
end
