require 'rails_helper'

RSpec.describe "dataset_files/edit", type: :view do
  before(:each) do
    @dataset_file = assign(:dataset_file, DatasetFile.create!(
      :dataset => nil,
      :seq => 1,
      :filename => "MyString",
      :filetype => "MyString"
    ))
  end

  it "renders the edit dataset_file form" do
    render

    assert_select "form[action=?][method=?]", dataset_file_path(@dataset_file), "post" do

      assert_select "input#dataset_file_dataset_id[name=?]", "dataset_file[dataset_id]"

      assert_select "input#dataset_file_seq[name=?]", "dataset_file[seq]"

      assert_select "input#dataset_file_filename[name=?]", "dataset_file[filename]"

      assert_select "input#dataset_file_filetype[name=?]", "dataset_file[filetype]"
    end
  end
end
