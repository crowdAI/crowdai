require 'rails_helper'

RSpec.describe "docker_files/edit", type: :view do
  before(:each) do
    @docker_file = assign(:docker_file, DockerFile.create!())
  end

  it "renders the edit docker_file form" do
    render

    assert_select "form[action=?][method=?]", docker_file_path(@docker_file), "post" do
    end
  end
end
