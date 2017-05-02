require 'rails_helper'

RSpec.describe "topics_controllers/index", type: :view do
  before(:each) do
    assign(:topics_controllers, [
      TopicsController.create!(),
      TopicsController.create!()
    ])
  end

  it "renders a list of topics_controllers" do
    render
  end
end
