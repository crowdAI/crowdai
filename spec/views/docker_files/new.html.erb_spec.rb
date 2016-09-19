require 'rails_helper'

RSpec.describe "docker_files/new", type: :view do
  before(:each) do
    assign(:docker_file, DockerFile.new())
  end

  it "renders new docker_file form" do
    render

    assert_select "form[action=?][method=?]", docker_files_path, "post" do
    end
  end
end
