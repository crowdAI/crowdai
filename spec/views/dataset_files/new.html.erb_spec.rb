require 'rails_helper'

RSpec.describe "dataset_files/new", type: :view do
  before(:each) do
    assign(:dataset_file, DatasetFile.new(
      :dataset => nil,
      :seq => 1,
      :filename => "MyString",
      :filetype => "MyString"
    ))
  end

  it "renders new dataset_file form" do
    render

    assert_select "form[action=?][method=?]", dataset_files_path, "post" do

      assert_select "input#dataset_file_dataset_id[name=?]", "dataset_file[dataset_id]"

      assert_select "input#dataset_file_seq[name=?]", "dataset_file[seq]"

      assert_select "input#dataset_file_filename[name=?]", "dataset_file[filename]"

      assert_select "input#dataset_file_filetype[name=?]", "dataset_file[filetype]"
    end
  end
end
