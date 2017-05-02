require 'rails_helper'

RSpec.describe "topics_controllers/new", type: :view do
  before(:each) do
    assign(:topics_controller, TopicsController.new())
  end

  it "renders new topics_controller form" do
    render

    assert_select "form[action=?][method=?]", topics_controllers_path, "post" do
    end
  end
end
