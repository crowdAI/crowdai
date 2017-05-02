require 'rails_helper'

RSpec.describe "topics_controllers/show", type: :view do
  before(:each) do
    @topics_controller = assign(:topics_controller, TopicsController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
