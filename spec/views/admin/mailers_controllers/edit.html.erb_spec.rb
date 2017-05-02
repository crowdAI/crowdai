require 'rails_helper'

RSpec.describe "admin/mailers_controllers/edit", type: :view do
  before(:each) do
    @admin_mailers_controller = assign(:admin_mailers_controller, Admin::MailersController.create!())
  end

  it "renders the edit admin_mailers_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_mailers_controller_path(@admin_mailers_controller), "post" do
    end
  end
end
