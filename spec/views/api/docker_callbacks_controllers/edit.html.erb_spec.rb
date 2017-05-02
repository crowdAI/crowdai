require 'rails_helper'

RSpec.describe "api/docker_callbacks_controllers/edit", type: :view do
  before(:each) do
    @api_docker_callbacks_controller = assign(:api_docker_callbacks_controller, Api::DockerCallbacksController.create!())
  end

  it "renders the edit api_docker_callbacks_controller form" do
    render

    assert_select "form[action=?][method=?]", api_docker_callbacks_controller_path(@api_docker_callbacks_controller), "post" do
    end
  end
end
