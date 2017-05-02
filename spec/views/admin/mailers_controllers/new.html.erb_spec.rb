require 'rails_helper'

RSpec.describe "admin/mailers_controllers/new", type: :view do
  before(:each) do
    assign(:admin_mailers_controller, Admin::MailersController.new())
  end

  it "renders new admin_mailers_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_mailers_controllers_path, "post" do
    end
  end
end
