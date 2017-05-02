require 'rails_helper'

RSpec.describe "admin/mailers_controllers/index", type: :view do
  before(:each) do
    assign(:admin_mailers_controllers, [
      Admin::MailersController.create!(),
      Admin::MailersController.create!()
    ])
  end

  it "renders a list of admin/mailers_controllers" do
    render
  end
end
