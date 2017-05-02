require 'rails_helper'

RSpec.describe "admin/topics_controllers/edit", type: :view do
  before(:each) do
    @admin_topics_controller = assign(:admin_topics_controller, Admin::TopicsController.create!())
  end

  it "renders the edit admin_topics_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_topics_controller_path(@admin_topics_controller), "post" do
    end
  end
end
