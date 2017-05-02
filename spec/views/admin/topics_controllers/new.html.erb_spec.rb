require 'rails_helper'

RSpec.describe "admin/topics_controllers/new", type: :view do
  before(:each) do
    assign(:admin_topics_controller, Admin::TopicsController.new())
  end

  it "renders new admin_topics_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_topics_controllers_path, "post" do
    end
  end
end
