require 'rails_helper'

RSpec.describe "docker_files/show", type: :view do
  before(:each) do
    @docker_file = assign(:docker_file, DockerFile.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
