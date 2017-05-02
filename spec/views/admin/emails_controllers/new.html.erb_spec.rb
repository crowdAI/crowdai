require 'rails_helper'

RSpec.describe "admin/emails_controllers/new", type: :view do
  before(:each) do
    assign(:admin_emails_controller, Admin::EmailsController.new())
  end

  it "renders new admin_emails_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_emails_controllers_path, "post" do
    end
  end
end
