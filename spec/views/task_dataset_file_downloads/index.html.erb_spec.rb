require 'rails_helper'

RSpec.describe "task_dataset_file_downloads/index", type: :view do
  before(:each) do
    assign(:task_dataset_file_downloads, [
      TaskDatasetFileDownload.create!(
        :participant => "",
        :task_dataset_file => "",
        :ip_address => "Ip Address"
      ),
      TaskDatasetFileDownload.create!(
        :participant => "",
        :task_dataset_file => "",
        :ip_address => "Ip Address"
      )
    ])
  end

  it "renders a list of task_dataset_file_downloads" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Ip Address".to_s, :count => 2
  end
end
