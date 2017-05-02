require 'rails_helper'

RSpec.describe "admin/topics_controllers/index", type: :view do
  before(:each) do
    assign(:admin_topics_controllers, [
      Admin::TopicsController.create!(),
      Admin::TopicsController.create!()
    ])
  end

  it "renders a list of admin/topics_controllers" do
    render
  end
end
