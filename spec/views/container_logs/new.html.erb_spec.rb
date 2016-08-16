require 'rails_helper'

RSpec.describe "container_logs/new", type: :view do
  before(:each) do
    assign(:container_log, ContainerLog.new())
  end

  it "renders new container_log form" do
    render

    assert_select "form[action=?][method=?]", container_logs_path, "post" do
    end
  end
end
