require 'rails_helper'

RSpec.describe "container_logs/edit", type: :view do
  before(:each) do
    @container_log = assign(:container_log, ContainerLog.create!())
  end

  it "renders the edit container_log form" do
    render

    assert_select "form[action=?][method=?]", container_log_path(@container_log), "post" do
    end
  end
end
