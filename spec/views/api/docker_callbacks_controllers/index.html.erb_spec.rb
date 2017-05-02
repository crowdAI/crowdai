require 'rails_helper'

RSpec.describe "api/docker_callbacks_controllers/index", type: :view do
  before(:each) do
    assign(:api_docker_callbacks_controllers, [
      Api::DockerCallbacksController.create!(),
      Api::DockerCallbacksController.create!()
    ])
  end

  it "renders a list of api/docker_callbacks_controllers" do
    render
  end
end
