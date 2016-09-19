require 'rails_helper'

RSpec.describe "docker_files/index", type: :view do
  before(:each) do
    assign(:docker_files, [
      DockerFile.create!(),
      DockerFile.create!()
    ])
  end

  it "renders a list of docker_files" do
    render
  end
end
