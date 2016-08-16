require 'rails_helper'

RSpec.describe "container_logs/index", type: :view do
  before(:each) do
    assign(:container_logs, [
      ContainerLog.create!(),
      ContainerLog.create!()
    ])
  end

  it "renders a list of container_logs" do
    render
  end
end
