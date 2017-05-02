require 'rails_helper'

RSpec.describe "api/docker_callbacks_controllers/show", type: :view do
  before(:each) do
    @api_docker_callbacks_controller = assign(:api_docker_callbacks_controller, Api::DockerCallbacksController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
