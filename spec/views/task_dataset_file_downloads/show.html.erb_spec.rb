require 'rails_helper'

RSpec.describe "task_dataset_file_downloads/show", type: :view do
  before(:each) do
    @task_dataset_file_download = assign(:task_dataset_file_download, TaskDatasetFileDownload.create!(
      :participant => "",
      :task_dataset_file => "",
      :ip_address => "Ip Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Ip Address/)
  end
end
