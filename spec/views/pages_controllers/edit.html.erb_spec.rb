require 'rails_helper'

RSpec.describe "pages_controllers/edit", type: :view do
  before(:each) do
    @pages_controller = assign(:pages_controller, PagesController.create!())
  end

  it "renders the edit pages_controller form" do
    render

    assert_select "form[action=?][method=?]", pages_controller_path(@pages_controller), "post" do
    end
  end
end
