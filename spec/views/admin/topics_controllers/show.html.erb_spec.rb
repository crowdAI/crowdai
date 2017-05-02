require 'rails_helper'

RSpec.describe "admin/topics_controllers/show", type: :view do
  before(:each) do
    @admin_topics_controller = assign(:admin_topics_controller, Admin::TopicsController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
