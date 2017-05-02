require 'rails_helper'

RSpec.describe "admin/emails_controllers/edit", type: :view do
  before(:each) do
    @admin_emails_controller = assign(:admin_emails_controller, Admin::EmailsController.create!())
  end

  it "renders the edit admin_emails_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_emails_controller_path(@admin_emails_controller), "post" do
    end
  end
end
