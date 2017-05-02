require 'rails_helper'

RSpec.describe "admin/emails_controllers/index", type: :view do
  before(:each) do
    assign(:admin_emails_controllers, [
      Admin::EmailsController.create!(),
      Admin::EmailsController.create!()
    ])
  end

  it "renders a list of admin/emails_controllers" do
    render
  end
end
