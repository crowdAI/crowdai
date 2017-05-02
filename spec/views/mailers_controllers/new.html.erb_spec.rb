require 'rails_helper'

RSpec.describe "mailers_controllers/new", type: :view do
  before(:each) do
    assign(:mailers_controller, MailersController.new())
  end

  it "renders new mailers_controller form" do
    render

    assert_select "form[action=?][method=?]", mailers_controllers_path, "post" do
    end
  end
end
