require 'rails_helper'

RSpec.describe "emails_controllers/new", type: :view do
  before(:each) do
    assign(:emails_controller, EmailsController.new())
  end

  it "renders new emails_controller form" do
    render

    assert_select "form[action=?][method=?]", emails_controllers_path, "post" do
    end
  end
end
