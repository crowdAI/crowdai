require 'rails_helper'

RSpec.describe "topics_controllers/edit", type: :view do
  before(:each) do
    @topics_controller = assign(:topics_controller, TopicsController.create!())
  end

  it "renders the edit topics_controller form" do
    render

    assert_select "form[action=?][method=?]", topics_controller_path(@topics_controller), "post" do
    end
  end
end
