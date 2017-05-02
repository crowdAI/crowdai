require 'rails_helper'

RSpec.describe "api/docker_callbacks_controllers/new", type: :view do
  before(:each) do
    assign(:api_docker_callbacks_controller, Api::DockerCallbacksController.new())
  end

  it "renders new api_docker_callbacks_controller form" do
    render

    assert_select "form[action=?][method=?]", api_docker_callbacks_controllers_path, "post" do
    end
  end
end
